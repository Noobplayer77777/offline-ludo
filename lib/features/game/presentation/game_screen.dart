import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/features/game/domain/board/board_geometry.dart';
import 'package:offline_ludo/features/game/presentation/board/ludo_board_widget.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/presentation/providers/game_provider.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/lobby/domain/services/network_lobby_service.dart';
import 'package:offline_ludo/features/network/domain/client_network_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_ludo/core/animations/dice_animator.dart';
import 'package:offline_ludo/core/animations/token_animator.dart';
import 'package:offline_ludo/core/animations/looping_animator.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';
import 'package:offline_ludo/core/ui/cyber_button.dart';
import 'package:offline_ludo/core/ui/neon_container.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';
import 'package:offline_ludo/features/settings/presentation/settings_dialog.dart';
import 'package:confetti/confetti.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 5));
    // Start BGM
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AudioManager.instance.playBgm('audio/bgm_game.mp3');
    });
  }

  @override
  void dispose() {
    AudioManager.instance.stopBgm();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);
    final myPlayerId = ref.watch(currentPlayerIdProvider);

    // Trigger confetti on win
    ref.listen(gameStateProvider, (previous, next) {
      if (previous?.winnerId == null && next?.winnerId != null) {
        AudioManager.instance.playSfx('audio/sfx_win.mp3');
        _confettiController.play();
      }
    });

    if (gameState == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final isMyTurn = gameState.activePlayerId == myPlayerId;

    // Note: actually we need to stream it, but we can't easily inline StreamProvider.
    // Instead we'll rely on the fact that if a game state update arrives, we're connected.
    // Let's use a StreamBuilder for networkState inside the build method.

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/board_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Connection Indicator
                  const LoopingFade(
                    duration: Duration(seconds: 1),
                    child: Icon(
                      Icons.wifi,
                      color: Colors.green,
                    ),
                  ),
                  // Turn Glow
                  LoopingPulse(
                    minScale: 1.0,
                    maxScale: 1.1,
                    duration: const Duration(milliseconds: 800),
                    child: NeonContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: BoardGeometry.getColorForPlayer(
                        gameState.players.firstWhere((p) => p.id == gameState.activePlayerId).color,
                      ),
                      isGlowing: true,
                      blurRadius: 10,
                      spreadRadius: 2,
                      child: Text(
                        'TURN: ${gameState.players.firstWhere((p) => p.id == gameState.activePlayerId).name.toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    tooltip: 'Settings',
                    onPressed: () {
                      AudioManager.instance.playSfx('audio/sfx_click.mp3');
                      showDialog<void>(
                        context: context,
                        builder: (ctx) => const SettingsDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const LudoBoardWidget(),
                  
                  // Draw Tokens
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final double boardSize = constraints.maxWidth < constraints.maxHeight 
                          ? constraints.maxWidth 
                          : constraints.maxHeight;
                      
                      // Board has 16 padding on all sides due to LudoBoardWidget Padding
                      final double usableSize = boardSize - 32;
                      final double cellSize = usableSize / BoardGeometry.gridSize;

                      return SizedBox(
                        width: usableSize,
                        height: usableSize,
                        child: Stack(
                          children: [
                            for (final player in gameState.players)
                              for (int i = 0; i < 4; i++)
                                () {
                                  final token = gameState.tokens.firstWhere(
                                      (t) => t.ownerId == player.id && t.id.endsWith('_$i'),
                                      orElse: () => Token(id: '${player.id}_token_$i', ownerId: player.id, position: -1));
                                  return TokenAnimator(
                                    token: token,
                                    color: player.color,
                                    tokenIndex: i,
                                    cellSize: cellSize,
                                    onTap: () {
                                      if (isMyTurn && gameState.hasRolledDice) {
                                        ref.read(gameStateProvider.notifier).moveToken(token.id);
                                      }
                                    },
                                  );
                                }(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            
            // Dice Area
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  DiceAnimator(
                    value: gameState.currentDice.value,
                    hasRolled: gameState.hasRolledDice,
                  ),
                  const SizedBox(height: 16),
                  CyberButton(
                    onPressed: isMyTurn && !gameState.hasRolledDice ? () {
                      ref.read(gameStateProvider.notifier).rollDice();
                    } : () {},
                    label: 'ROLL DICE',
                    icon: Icons.casino,
                    isPrimary: isMyTurn && !gameState.hasRolledDice,
                  ),
                ],
              ),
            ),
            // Confetti
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
              ),
            ),
            if (gameState.winnerId != null)
              Container(
                color: Colors.black87,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Winner: ${gameState.players.firstWhere((p) => p.id == gameState.winnerId).name}',
                        style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      CyberButton(
                        icon: Icons.exit_to_app,
                        label: 'RETURN TO UPLINK',
                        isPrimary: false,
                        onPressed: () async {
                          final service = ref.read(lobbyServiceProvider);
                          await service.leaveRoom();
                          if (context.mounted) {
                            context.go('/');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),

            // Connection Lost Overlay
            StreamBuilder<NetworkState>(
              stream: ref.read(clientNetworkManagerProvider).stateStream,
              initialData: ref.read(clientNetworkManagerProvider).state,
              builder: (context, snapshot) {
                if (snapshot.data == NetworkState.disconnected && gameState.winnerId == null) {
                  return Container(
                    color: Colors.black.withValues(alpha: 0.8),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.wifi_off, color: Colors.red, size: 64),
                          const SizedBox(height: 16),
                          const Text(
                            'CONNECTION LOST',
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2.0),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Attempting to reconnect...',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(height: 32),
                          CyberButton(
                            onPressed: () {
                              ref.read(lobbyServiceProvider).leaveRoom();
                              context.go('/');
                            },
                            label: 'RETURN TO BASE',
                            icon: Icons.exit_to_app,
                            isPrimary: false,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}
