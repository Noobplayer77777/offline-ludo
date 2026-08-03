import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/presentation/providers/game_provider.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';
import 'package:offline_ludo/features/settings/presentation/settings_dialog.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';
import 'package:offline_ludo/core/ui/cyber_button.dart';

class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({super.key});

  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Player> _currentPlayers = [];
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lobby = ref.read(lobbyStateProvider);
      if (lobby != null) {
        _syncList(lobby.players);
      }
    });
  }
  
  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Color _getColorForPlayer(PlayerColor color) {
    switch (color) {
      case PlayerColor.red:
        return AppColors.playerRed;
      case PlayerColor.green:
        return AppColors.playerGreen;
      case PlayerColor.yellow:
        return AppColors.playerYellow;
      case PlayerColor.blue:
        return AppColors.playerBlue;
    }
  }

  void _syncList(List<Player> newPlayers) {
    for (int i = 0; i < newPlayers.length; i++) {
      if (i >= _currentPlayers.length) {
        _currentPlayers.insert(i, newPlayers[i]);
        _listKey.currentState?.insertItem(i);
      } else if (_currentPlayers[i].id != newPlayers[i].id) {
        final removedPlayer = _currentPlayers.removeAt(i);
        _listKey.currentState?.removeItem(
          i,
          (context, animation) => _buildItem(removedPlayer, animation, context),
        );
        i--;
      } else {
        _currentPlayers[i] = newPlayers[i];
      }
    }
    while (_currentPlayers.length > newPlayers.length) {
      final idx = _currentPlayers.length - 1;
      final removedPlayer = _currentPlayers.removeAt(idx);
      _listKey.currentState?.removeItem(
        idx,
        (context, animation) => _buildItem(removedPlayer, animation, context),
      );
    }
  }

  Widget _buildItem(Player player, Animation<double> animation, BuildContext context) {
    final myId = ref.read(currentPlayerIdProvider);
    final isMe = player.id == myId;
    final isHost = _currentPlayers.isNotEmpty && _currentPlayers.first.id == player.id;
    final pColor = _getColorForPlayer(player.color);
    
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.surfaceHighlight.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: player.isReady ? AppColors.success : pColor.withOpacity(0.5),
              width: player.isReady ? 2 : 1,
            ),
            boxShadow: player.isReady ? [
              BoxShadow(color: AppColors.success.withOpacity(0.2), blurRadius: 10, spreadRadius: 1)
            ] : null,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pColor.withOpacity(0.2),
                    border: Border.all(color: pColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: pColor.withOpacity(0.5 * _pulseController.value),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    isHost ? Icons.star : Icons.person,
                    color: pColor,
                  ),
                );
              }
            ),
            title: Text(
              player.name.toUpperCase() + (isMe ? ' [YOU]' : ''),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 1.5,
              ),
            ),
            subtitle: Text(
              isHost ? 'HOST NODE' : 'CLIENT NODE',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.onSurfaceVariant,
                letterSpacing: 1.0,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isMe && _currentPlayers.isNotEmpty && _currentPlayers.first.id == myId)
                  IconButton(
                    icon: const Icon(Icons.power_settings_new, color: AppColors.error),
                    tooltip: 'DISCONNECT NODE',
                    onPressed: () {
                      AudioManager.instance.playSfx('audio/sfx_click.mp3');
                      ref.read(lobbyServiceProvider).kickPlayer(player.id);
                    },
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: player.isReady ? AppColors.success.withOpacity(0.2) : AppColors.warning.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: player.isReady ? AppColors.success : AppColors.warning,
                    ),
                  ),
                  child: Text(
                    player.isReady ? 'READY' : 'STANDBY',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: player.isReady ? AppColors.success : AppColors.warning,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gameStateProvider, (previous, next) {
      if (next != null) {
        context.go('/game');
      }
    });

    ref.listen(lobbyStateProvider, (previous, next) {
      if (next != null) {
        _syncList(next.players);
      }
    });

    final lobby = ref.watch(lobbyStateProvider);
    final myId = ref.watch(currentPlayerIdProvider);

    if (lobby == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go('/');
        }
      });
      return const Scaffold(backgroundColor: AppColors.background, body: Center(child: CircularProgressIndicator(color: AppColors.primary)));
    }

    final myPlayer = lobby.players.where((p) => p.id == myId).firstOrNull;
    final isHost = lobby.players.isNotEmpty && lobby.players.first.id == myId;
    final allReady = lobby.players.length > 1 && lobby.players.every((p) => p.isReady);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          lobby.room.name.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.primary,
            letterSpacing: 2.0,
            shadows: [Shadow(color: AppColors.primary, blurRadius: 10)],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.secondary),
            onPressed: () {
              AudioManager.instance.playSfx('audio/sfx_click.mp3');
              showDialog(
                context: context,
                builder: (ctx) => const SettingsDialog(),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () {
            AudioManager.instance.playSfx('audio/sfx_click.mp3');
            ref.read(lobbyServiceProvider).leaveRoom();
            if (context.mounted) {
              context.go('/');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Room Code HUD Display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppColors.surfaceHighlight.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary.withOpacity(0.5), width: 1),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 20, spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'UPLINK COORDINATES',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.primary.withOpacity(0.7),
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            lobby.room.code,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                              shadows: [Shadow(color: AppColors.primary, blurRadius: 15)],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.copy, color: AppColors.secondary),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: lobby.room.code));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('COORDINATES COPIED TO CLIPBOARD')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Player List
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _currentPlayers.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(_currentPlayers[index], animation, context);
                },
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Action Buttons
            if (myPlayer != null && !isHost)
              CyberButton(
                onPressed: () {
                  AudioManager.instance.playSfx('audio/sfx_click.mp3');
                  ref.read(lobbyServiceProvider).toggleReady();
                },
                icon: myPlayer.isReady ? Icons.close : Icons.check,
                label: myPlayer.isReady ? 'CANCEL READY' : 'INITIATE READY',
                isPrimary: !myPlayer.isReady,
              ),
              
            if (isHost)
              CyberButton(
                onPressed: allReady
                    ? () {
                        AudioManager.instance.playSfx('audio/sfx_click.mp3');
                        ref.read(lobbyServiceProvider).startGame();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('INITIATING START SEQUENCE...')),
                        );
                      }
                    : () {},
                icon: Icons.rocket_launch,
                label: allReady ? 'START SEQUENCE' : 'WAITING FOR NODES',
                isPrimary: allReady,
                isLoading: !allReady && lobby.players.length > 1, // Show loading spinner if waiting for others
              ),
          ],
        ),
      ),
    );
  }
}
