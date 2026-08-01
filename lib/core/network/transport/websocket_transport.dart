import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'network_transport.dart';

/// WebSockets implementation of the NetworkTransport.
class WebSocketTransport implements NetworkTransport {
  final WebSocketChannel _channel;
  final _incomingController = StreamController<String>.broadcast();
  final _disconnectController = StreamController<String>.broadcast();
  
  bool _isClosed = false;

  WebSocketTransport(this._channel) {
    _channel.stream.listen(
      (data) {
        if (data is String) {
          _incomingController.add(data);
        }
      },
      onDone: () {
        _handleClose(_channel.closeReason ?? 'Closed normally');
      },
      onError: (dynamic e) {
        _handleClose(e.toString());
      },
    );
  }

  void _handleClose(String reason) {
    if (_isClosed) return;
    _isClosed = true;
    _disconnectController.add(reason);
    _incomingController.close();
    _disconnectController.close();
  }

  @override
  Stream<String> get incomingMessages => _incomingController.stream;

  @override
  Stream<String> get onDisconnect => _disconnectController.stream;

  @override
  void sendMessage(String message) {
    if (!_isClosed) {
      _channel.sink.add(message);
    }
  }

  @override
  Future<void> disconnect() async {
    if (_isClosed) return;
    await _channel.sink.close();
    _handleClose('Disconnected locally');
  }
}
