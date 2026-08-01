import 'package:flutter/material.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

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
}
