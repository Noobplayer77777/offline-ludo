import 'dart:async';
import 'package:flutter_test/flutter_test.dart';

import 'dart:math';

// Simulates a network transport with latency, drops, and jitter
class SimulatedTransport {
  final double packetDropRate;
  final int minLatencyMs;
  final int maxLatencyMs;
  final Random _rnd = Random();

  SimulatedTransport({
    this.packetDropRate = 0.0,
    this.minLatencyMs = 10,
    this.maxLatencyMs = 50,
  });

  Future<bool> sendPacket(String data) async {
    // Simulate drop
    if (packetDropRate > 0 && _rnd.nextDouble() < packetDropRate) {
      return false; // Dropped
    }

    // Simulate latency
    int latency = minLatencyMs + _rnd.nextInt(maxLatencyMs - minLatencyMs + 1);
    await Future.delayed(Duration(milliseconds: latency));
    return true; // Delivered
  }
}

void main() {
  group('Network Simulations', () {
    test('High packet drop rate simulation', () async {
      final transport = SimulatedTransport(packetDropRate: 0.5, minLatencyMs: 10, maxLatencyMs: 50);
      
      int delivered = 0;
      int dropped = 0;
      for (int i = 0; i < 100; i++) {
        bool success = await transport.sendPacket('test data');
        if (success) delivered++;
        else dropped++;
      }
      
      // In a 50% drop rate, we expect roughly equal delivered and dropped
      expect(delivered > 0, isTrue);
      expect(dropped > 0, isTrue);
    });

    test('Stress test - Packet flood', () async {
      final transport = SimulatedTransport(packetDropRate: 0.0, minLatencyMs: 1, maxLatencyMs: 5);
      
      final stopwatch = Stopwatch()..start();
      List<Future<bool>> tasks = [];
      for (int i = 0; i < 1000; i++) {
        tasks.add(transport.sendPacket('flood data $i'));
      }
      
      await Future.wait(tasks);
      stopwatch.stop();
      
      // Should process 1000 simulated packets quickly
      expect(stopwatch.elapsedMilliseconds < 2000, isTrue);
    });
  });
}
