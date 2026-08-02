import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:offline_ludo/features/game/domain/board/board_geometry.dart';
import 'package:offline_ludo/features/game/presentation/board/ludo_board_widget.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/presentation/providers/game_provider.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/core/animations/dice_animator.dart';
import 'package:offline_ludo/core/animations/token_animator.dart';
import 'package:offline_ludo/core/animations/looping_animator.dart';
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
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: BoardGeometry.getColorForPlayer(
                          gameState.players.firstWhere((p) => p.id == gameState.activePlayerId).color,
                        ).withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: BoardGeometry.getColorForPlayer(
                              gameState.players.firstWhere((p) => p.id == gameState.activePlayerId).color,
                            ),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Text(
                        'Turn: ${gameState.players.firstWhere((p) => p.id == gameState.activePlayerId).name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    tooltip: 'Settings',
                    onPressed: () {
                      AudioManager.instance.playSfx('audio/sfx_click.mp3');
                      showDialog(
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
                  ElevatedButton(
                    onPressed: isMyTurn && !gameState.hasRolledDice ? () {
                      ref.read(gameStateProvider.notifier).rollDice();
                    } : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      backgroundColor: isMyTurn ? Colors.green : Colors.grey,
                    ),
                    child: const Text('ROLL DICE', style: TextStyle(fontSize: 20)),
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
                color: Colors.black54,
                child: Center(
                  child: Text(
                    'Winner: ${gameState.players.firstWhere((p) => p.id == gameState.winnerId).name}',
                    style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
      ),
    );
  }
}
