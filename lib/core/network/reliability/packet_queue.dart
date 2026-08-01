import 'dart:collection';
import 'package:offline_ludo/core/network/models/packet.dart';

/// Manages outbound packets, assigning sequence IDs and buffering them.
class PacketQueue {
  final Queue<Packet> _outbox = Queue<Packet>();
  int _nextSequenceId = 1;

  /// Creates a new packet, assigns it a sequence ID, and adds it to the queue.
  Packet enqueue(PacketPayload payload, String clientId) {
    final packet = Packet(
      id: '${DateTime.now().millisecondsSinceEpoch}_$_nextSequenceId',
      clientId: clientId,
      timestamp: DateTime.now(),
      sequenceId: _nextSequenceId++,
      payload: payload,
    );
    _outbox.add(packet);
    return packet;
  }

  /// Extracts all packets currently in the queue.
  List<Packet> flush() {
    final packets = _outbox.toList();
    _outbox.clear();
    return packets;
  }

  /// Re-inserts packets that failed to send back to the front of the queue,
  /// preserving their original order and sequence IDs.
  void requeue(List<Packet> packets) {
    for (final packet in packets.reversed) {
      _outbox.addFirst(packet);
    }
  }

  bool get isEmpty => _outbox.isEmpty;
  int get length => _outbox.length;
}
