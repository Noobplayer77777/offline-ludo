abstract class LobbyService {
  /// Create a new room as the host
  Future<void> createRoom(String playerName);

  /// Join an existing room via a code
  Future<void> joinRoom(String roomCode, String playerName);

  Future<void> kickPlayer(String targetClientId);

  /// Toggle ready status for the current player
  Future<void> toggleReady();

  /// Leave the current room
  Future<void> leaveRoom();

  /// Start the game (Host only)
  Future<void> startGame();

  /// Reconnect to the last active room if session is saved
  Future<void> reconnectToRoom();

  /// Clear the saved session
  Future<void> clearSession();
}
