import 'package:flutter/material.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/domain/board/path_generator.dart';

class BoardGeometry {
  static const int gridSize = 15;
  static const int homeSize = 6;
  static const int centerSize = 3;

  static Color getColorForPlayer(PlayerColor color) {
    switch (color) {
      case PlayerColor.red:
        return const Color(0xFFE53935); // Red 600
      case PlayerColor.green:
        return const Color(0xFF43A047); // Green 600
      case PlayerColor.yellow:
        return const Color(0xFFFFB300); // Amber 600
      case PlayerColor.blue:
        return const Color(0xFF1E88E5); // Blue 600
    }
  }

  static Color getLightColorForPlayer(PlayerColor color) {
    switch (color) {
      case PlayerColor.red:
        return const Color(0xFFFFEBEE);
      case PlayerColor.green:
        return const Color(0xFFE8F5E9);
      case PlayerColor.yellow:
        return const Color(0xFFFFF8E1);
      case PlayerColor.blue:
        return const Color(0xFFE3F2FD);
    }
  }

  static Offset getTokenPosition(Token token, PlayerColor color, int tokenIndex) {
    if (token.position == -1) {
      // Home
      double gridX = 0;
      double gridY = 0;
      switch (color) {
        case PlayerColor.green:
          gridX = 0; gridY = 0; break;
        case PlayerColor.yellow:
          gridX = 9; gridY = 0; break;
        case PlayerColor.blue:
          gridX = 9; gridY = 9; break;
        case PlayerColor.red:
          gridX = 0; gridY = 9; break;
      }
      
      const double centerOffset = homeSize / 2;
      const double distance = 1.2;
      
      final double ox = gridX + centerOffset;
      final double oy = gridY + centerOffset;
      
      switch (tokenIndex) {
        case 0: return Offset(ox - distance, oy - distance);
        case 1: return Offset(ox + distance, oy - distance);
        case 2: return Offset(ox - distance, oy + distance);
        case 3: return Offset(ox + distance, oy + distance);
      }
    } else if (token.position >= 0 && token.position <= 50) {
      // Main track
      final int trackIndex = (PathGenerator.startIndices[color]! + token.position) % 52;
      return PathGenerator.mainTrack[trackIndex];
    } else if (token.position >= 51 && token.position <= 56) {
      // Finish lane
      final int finishLaneIndex = token.position - 51;
      return PathGenerator.finishLanes[color]![finishLaneIndex];
    } else if (token.position == 57) {
      // Finished
      return const Offset(7.5, 7.5);
    }
    return const Offset(0, 0);
  }
}
