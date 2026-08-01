import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:offline_ludo/features/lobby/presentation/providers/lobby_provider.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

class LobbyScreen extends ConsumerWidget {
  const LobbyScreen({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
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
                child: ListView.separated(
                  itemCount: lobby.players.length,
                  separatorBuilder: (context, index) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final player = lobby.players[index];
                    final isMe = player.id == myId;
                    final isPlayerHost = index == 0;
                    
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getColorForPlayer(player.color),
                        child: Icon(
                          isPlayerHost ? Icons.star : Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        player.name + (isMe ? ' (You)' : ''),
                        style: TextStyle(
                          fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: Container(
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
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Action Buttons
            if (myPlayer != null && !isHost)
              ElevatedButton.icon(
                onPressed: () => ref.read(lobbyServiceProvider).toggleReady(),
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
