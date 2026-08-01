import 'dart:async';

/// Abstracts the underlying socket or WebSocket connection.
abstract class NetworkTransport {
  /// Stream of incoming raw messages (JSON strings).
  Stream<String> get incomingMessages;

  /// Stream that emits a reason string when the connection is closed.
  Stream<String> get onDisconnect;

  /// Send a raw string message over the transport.
  void sendMessage(String message);

  /// Gracefully closes the connection.
  Future<void> disconnect();
}
