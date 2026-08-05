import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:offline_ludo/features/network/domain/client_network_manager.dart';
import 'package:offline_ludo/features/network/domain/host_server_manager.dart';
import 'package:offline_ludo/core/network/models/packet.dart';
import 'package:offline_ludo/core/network/transport/network_transport.dart';
import 'dart:async';
import 'dart:convert';

class MockNetworkTransport extends Mock implements NetworkTransport {}
void main() {
  setUpAll(() {
    registerFallbackValue(const PacketPayload.joinRoom(username: 'test', version: '1.0'));
  });

  group('Packet Serialization', () {
    test('serialize and deserialize JoinRoom', () {
      const payload = PacketPayload.joinRoom(username: 'test', version: '1.0');
      final packet = Packet(
        id: '1',
        clientId: 'client1',
        timestamp: DateTime.utc(2023, 1, 1),
        sequenceId: 1,
        payload: payload,
      );

      final json = jsonDecode(jsonEncode(packet.toJson())) as Map<String, dynamic>;
      final decoded = Packet.fromJson(json);

      expect(decoded.id, '1');
      expect(decoded.clientId, 'client1');
      expect(decoded.sequenceId, 1);
      expect(decoded.payload, isA<PacketPayload>());
      decoded.payload.mapOrNull(
        joinRoom: (p) {
          expect(p.username, 'test');
          expect(p.version, '1.0');
        }
      );
    });
  });

  group('ClientNetworkManager', () {
    late ClientNetworkManager manager;
    late MockNetworkTransport mockTransport;
    late StreamController<String> incomingController;
    late StreamController<String> disconnectController;

    setUp(() {
      manager = ClientNetworkManager();
      mockTransport = MockNetworkTransport();
      incomingController = StreamController<String>.broadcast();
      disconnectController = StreamController<String>.broadcast();

      when(() => mockTransport.incomingMessages).thenAnswer((_) => incomingController.stream);
      when(() => mockTransport.onDisconnect).thenAnswer((_) => disconnectController.stream);
      when(() => mockTransport.sendMessage(any())).thenReturn(null);
      when(() => mockTransport.disconnect()).thenAnswer((_) async {});
    });

    tearDown(() {
      manager.dispose();
      incomingController.close();
      disconnectController.close();
    });

    test('attachTransport sets state to connected', () {
      expect(manager.state, NetworkState.disconnected);
      manager.attachTransport(mockTransport);
      expect(manager.state, NetworkState.connected);
    });

    test('sendIntent buffers if disconnected', () {
      manager.setClientId('client1');
      manager.sendIntent(const PacketPayload.ping());
      verifyNever(() => mockTransport.sendMessage(any()));

      // Now attach, it should flush
      manager.attachTransport(mockTransport);
      verify(() => mockTransport.sendMessage(any())).called(1);
    });

    test('incoming packets are parsed and emitted', () async {
      manager.attachTransport(mockTransport);
      
      final packet = Packet(
        id: '1',
        clientId: 'host',
        timestamp: DateTime.now(),
        sequenceId: 1,
        payload: const PacketPayload.error(message: 'error'),
      );

      final expectation = expectLater(manager.incomingPackets, emits(isA<Packet>()));
      incomingController.add(jsonEncode(packet.toJson()));
      await expectation;
    });
  });

  group('HostServerManager', () {
    late HostServerManager server;
    
    setUp(() {
      server = HostServerManager(port: 0); // Use 0 for random available port
    });

    tearDown(() async {
      await server.stop();
    });

    test('start and stop server', () async {
      await server.start();
      // It should bind successfully without throwing
      expect(true, true);
    });
    
    test('broadcast does not crash with no clients', () {
      server.broadcast(const PacketPayload.ping());
      expect(true, true);
    });
  });
}
