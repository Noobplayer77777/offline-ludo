import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/presentation/providers/game_provider.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';
import 'package:offline_ludo/features/settings/presentation/settings_dialog.dart';
class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({super.key});

  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Player> _currentPlayers = [];

  @override
  void initState() {
    super.initState();
    // Delay slightly to let the widget mount, then sync initial state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lobby = ref.read(lobbyStateProvider);
      if (lobby != null) {
        _syncList(lobby.players);
      }
    });
  }

  Color _getColorForPlayer(PlayerColor color) {
    switch (color) {
      case PlayerColor.red:
        return Colors.red;
      case PlayerColor.green:
        return Colors.green;
      case PlayerColor.yellow:
        return Colors.yellow;
      case PlayerColor.blue:
        return Colors.blue;
    }
  }

  void _syncList(List<Player> newPlayers) {
    // Basic diffing
    for (int i = 0; i < newPlayers.length; i++) {
      if (i >= _currentPlayers.length) {
        _currentPlayers.insert(i, newPlayers[i]);
        _listKey.currentState?.insertItem(i);
      } else if (_currentPlayers[i].id != newPlayers[i].id) {
        // Assume removed
        final removedPlayer = _currentPlayers.removeAt(i);
        _listKey.currentState?.removeItem(
          i,
          (context, animation) => _buildItem(removedPlayer, animation, context),
        );
        i--;
      } else {
        // Update state of existing player
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
    final isPlayerHost = _currentPlayers.isNotEmpty && _currentPlayers.first.id == player.id;
    
    return SizeTransition(
      sizeFactor: animation,
      child: FadeTransition(
        opacity: animation,
        child: Semantics(
          label: '${player.name}, ${isPlayerHost ? "Host" : "Player"}, Status: ${player.isReady ? "Ready" : "Not Ready"}',
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getColorForPlayer(player.color),
              child: Icon(
                isPlayerHost ? Icons.star : Icons.person,
                color: Colors.white,
                semanticLabel: isPlayerHost ? 'Host Icon' : 'Player Icon',
              ),
            ),
            title: Text(
              player.name + (isMe ? ' (You)' : ''),
              style: TextStyle(
                fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isMe && _currentPlayers.isNotEmpty && _currentPlayers.first.id == myId)
                  IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    tooltip: 'Kick Player',
                    onPressed: () {
                      AudioManager.instance.playSfx('audio/sfx_click.mp3');
                      ref.read(lobbyServiceProvider).kickPlayer(player.id);
                    },
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: player.isReady ? Colors.green.withValues(alpha: 0.2) : Colors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: player.isReady ? Colors.green : Colors.orange,
                    ),
                  ),
                  child: Text(
                    player.isReady ? 'READY' : 'WAITING',
                    style: TextStyle(
                      color: player.isReady ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
      // If lobby is null, it means we've been disconnected or kicked/left.
      // We should return to main menu, but we handle it via a post-frame callback
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go('/');
        }
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final myPlayer = lobby.players.where((p) => p.id == myId).firstOrNull;
    final isHost = lobby.players.isNotEmpty && lobby.players.first.id == myId;
    final allReady = lobby.players.length > 1 && lobby.players.every((p) => p.isReady);

    return Scaffold(
      appBar: AppBar(
        title: Text(lobby.room.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
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
          icon: const Icon(Icons.arrow_back),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Room Code Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Room Code',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          lobby.room.code,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: lobby.room.code));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Room code copied!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Player List
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: _currentPlayers.length,
                  itemBuilder: (context, index, animation) {
                    return _buildItem(_currentPlayers[index], animation, context);
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Action Buttons
            if (myPlayer != null && !isHost)
              ElevatedButton.icon(
                onPressed: () {
                  AudioManager.instance.playSfx('audio/sfx_click.mp3');
                  ref.read(lobbyServiceProvider).toggleReady();
                },
                icon: Icon(myPlayer.isReady ? Icons.close : Icons.check),
                label: Text(myPlayer.isReady ? 'Cancel Ready' : 'Ready Up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: myPlayer.isReady ? Colors.orange : Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
              
            if (isHost)
              ElevatedButton.icon(
                onPressed: allReady
                    ? () {
                        AudioManager.instance.playSfx('audio/sfx_click.mp3');
                        // TODO: Navigate to GameScreen when StartGame is called
                        ref.read(lobbyServiceProvider).startGame();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Starting Game!')),
                        );
                      }
                    : null,
                icon: const Icon(Icons.play_arrow),
                label: Text(allReady ? 'Start Game' : 'Waiting for Players...'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
