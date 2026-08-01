import 'package:offline_ludo/features/game/domain/board/path_generator.dart';
import 'package:offline_ludo/features/game/domain/models/game_state.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/domain/models/move.dart';
import 'package:offline_ludo/features/game/domain/models/dice.dart';

class RuleEngine {
  /// Check if the player is allowed to roll the dice.
  static bool canRollDice(GameState state, String playerId) {
    if (state.phase != GamePhase.playing) return false;
    if (state.activePlayerId != playerId) return false;
    if (state.hasRolledDice) return false; // Already rolled, must move or pass
    return true;
  }

  /// Check if a specific token can be moved with the given dice value.
  static bool canMoveToken(Token token, int diceValue) {
    // Cannot move finished tokens
    if (token.position == 57) return false;

    // Tokens at home (-1) need a 6 to exit
    if (token.position == -1) {
      return diceValue == 6;
    }

    // Check if move would overshoot the exact finish
    if (token.position + diceValue > 57) {
      return false;
    }

    return true;
  }

  /// Returns a list of tokens owned by the player that can legally move.
  static List<Token> getValidTokensToMove(GameState state, String playerId, int diceValue) {
    return state.tokens
        .where((t) => t.ownerId == playerId && canMoveToken(t, diceValue))
        .toList();
  }

  /// Checks if moving the [movingToken] to its new position captures any opponent tokens.
  /// Returns a list of captured tokens (typically 0 or 1, but could be more).
  static List<Token> checkCapture(GameState state, Token movingToken, int targetRelativePosition) {
    // Only main track cells can have captures
    if (targetRelativePosition < 0 || targetRelativePosition > 51) return [];

    final movingPlayerColor = _getPlayerColor(state, movingToken.ownerId);
    final targetTrackIndex = (PathGenerator.startIndices[movingPlayerColor]! + targetRelativePosition) % 52;

    // Safe zones cannot have captures
    if (PathGenerator.isSafeZone(targetTrackIndex)) return [];

    final List<Token> captured = [];
    for (var token in state.tokens) {
      if (token.ownerId == movingToken.ownerId) continue;
      if (token.position < 0 || token.position > 51) continue;

      final tokenColor = _getPlayerColor(state, token.ownerId);
      final tokenTrackIndex = (PathGenerator.startIndices[tokenColor]! + token.position) % 52;

      if (tokenTrackIndex == targetTrackIndex) {
        captured.add(token);
      }
    }

    return captured;
  }

  /// Checks if the player has won (all 4 tokens at position 57).
  static bool checkWinner(GameState state, String playerId) {
    final playerTokens = state.tokens.where((t) => t.ownerId == playerId);
    return playerTokens.length == 4 && playerTokens.every((t) => t.position == 57);
  }

  /// Helper to get a player's color
  static PlayerColor _getPlayerColor(GameState state, String playerId) {
    return state.players.firstWhere((p) => p.id == playerId).color;
  }

  /// Helper to get the next valid player's ID in a clockwise fashion.
  static String _getNextPlayerId(GameState state, String currentPlayerId) {
    final currentIndex = state.players.indexWhere((p) => p.id == currentPlayerId);
    int nextIndex = (currentIndex + 1) % state.players.length;
    
    // Skip finished players if any
    while (state.players[nextIndex].hasFinished) {
      nextIndex = (nextIndex + 1) % state.players.length;
      if (nextIndex == currentIndex) break; // Everyone finished?
    }
    
    return state.players[nextIndex].id;
  }

  /// Executes a dice roll state transition.
  static GameState executeRoll(GameState state, int diceValue) {
    if (state.activePlayerId == null) return state;

    int newConsecutiveSixes = state.consecutiveSixesCount;
    if (diceValue == 6) {
      newConsecutiveSixes++;
    } else {
      newConsecutiveSixes = 0;
    }

    // Penalty for 3 consecutive sixes
    if (newConsecutiveSixes == 3) {
      return state.copyWith(
        currentDice: Dice(value: diceValue, isRolling: false),
        consecutiveSixesCount: 0,
        hasRolledDice: false,
        activePlayerId: _getNextPlayerId(state, state.activePlayerId!),
      );
    }

    // Determine if player has any valid moves
    final validTokens = getValidTokensToMove(state, state.activePlayerId!, diceValue);
    if (validTokens.isEmpty) {
      // Turn skips automatically
      final nextPlayer = (diceValue == 6) ? state.activePlayerId : _getNextPlayerId(state, state.activePlayerId!);
      return state.copyWith(
        currentDice: Dice(value: diceValue, isRolling: false),
        consecutiveSixesCount: (diceValue == 6) ? newConsecutiveSixes : 0,
        hasRolledDice: false,
        activePlayerId: nextPlayer,
      );
    }

    return state.copyWith(
      currentDice: Dice(value: diceValue, isRolling: false),
      consecutiveSixesCount: newConsecutiveSixes,
      hasRolledDice: true, // Now waiting for move
    );
  }

  /// Executes a token move state transition.
  static GameState executeMove(GameState state, Move move) {
    final movingToken = state.tokens.firstWhere((t) => t.id == move.tokenId);
    
    // Calculate new position
    final int newPosition = move.toPosition;

    // Check for captures
    final capturedTokens = checkCapture(state, movingToken, newPosition);

    // Update tokens array
    final newTokens = state.tokens.map((t) {
      if (t.id == movingToken.id) {
        return t.copyWith(position: newPosition);
      }
      if (capturedTokens.any((ct) => ct.id == t.id)) {
        return t.copyWith(position: -1); // Send back to base
      }
      return t;
    }).toList();

    // Check for finish
    final bool reachedFinish = newPosition == 57;
    
    // Update state to check for winner
    GameState updatedState = state.copyWith(tokens: newTokens);
    final bool hasWon = checkWinner(updatedState, move.playerId);
    
    List<Player> newPlayers = state.players;
    String? newWinnerId = state.winnerId;

    if (hasWon) {
      newPlayers = state.players.map((p) {
        if (p.id == move.playerId) {
          final int currentMaxRank = state.players.map((p) => p.rank).reduce((a, b) => a > b ? a : b);
          return p.copyWith(hasFinished: true, rank: currentMaxRank + 1);
        }
        return p;
      }).toList();
      
      if (state.winnerId == null) {
        newWinnerId = move.playerId;
      }
      
      updatedState = updatedState.copyWith(players: newPlayers, winnerId: newWinnerId);
    }

    // Determine next turn
    bool getsAnotherTurn = (state.currentDice.value == 6) || capturedTokens.isNotEmpty || reachedFinish;
    if (hasWon) {
      getsAnotherTurn = false; // Finished players don't play anymore
    }

    final String nextPlayerId = getsAnotherTurn 
        ? state.activePlayerId! 
        : _getNextPlayerId(updatedState, state.activePlayerId!);

    return updatedState.copyWith(
      hasRolledDice: false, // Turn consumed, ready for next roll
      activePlayerId: nextPlayerId,
    );
  }
}
