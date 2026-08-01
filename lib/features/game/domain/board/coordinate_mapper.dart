import 'package:flutter/material.dart';
import 'package:offline_ludo/features/game/domain/board/board_geometry.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

class CoordinateMapper {
  final double boardSize;
  final double cellSize;

  CoordinateMapper({required this.boardSize}) 
    : cellSize = boardSize / BoardGeometry.gridSize;

  /// Returns the physical center pixel coordinate for a given grid (x,y).
  Offset getCenterForGrid(Offset gridOffset) {
    return Offset(
      (gridOffset.dx * cellSize) + (cellSize / 2),
      (gridOffset.dy * cellSize) + (cellSize / 2),
    );
  }

  /// Returns the base center for a player's home
  Offset getHomeBaseCenter(PlayerColor color) {
    switch (color) {
      case PlayerColor.green:
        return getCenterForGrid(const Offset(2.5, 2.5));
      case PlayerColor.yellow:
        return getCenterForGrid(const Offset(11.5, 2.5));
      case PlayerColor.blue:
        return getCenterForGrid(const Offset(11.5, 11.5));
      case PlayerColor.red:
        return getCenterForGrid(const Offset(2.5, 11.5));
    }
  }

  /// Calculates positions for up to 4 tokens resting inside the base
  List<Offset> getHomeTokenPositions(PlayerColor color) {
    final center = getHomeBaseCenter(color);
    final offset = cellSize * 1.5; // Distance from center of base

    return [
      Offset(center.dx - offset, center.dy - offset),
      Offset(center.dx + offset, center.dy - offset),
      Offset(center.dx - offset, center.dy + offset),
      Offset(center.dx + offset, center.dy + offset),
    ];
  }
}
