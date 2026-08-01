import 'package:flutter/material.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

class PathGenerator {
  /// The 52 cells of the main track, starting from the top-left of the left arm 
  /// and moving clockwise around the board.
  static const List<Offset> mainTrack = [
    // Left arm, top row (L->R)
    Offset(0, 6), Offset(1, 6), Offset(2, 6), Offset(3, 6), Offset(4, 6), Offset(5, 6),
    // Top arm, left col (B->T)
    Offset(6, 5), Offset(6, 4), Offset(6, 3), Offset(6, 2), Offset(6, 1), Offset(6, 0),
    // Top arm, top row (L->R)
    Offset(7, 0), Offset(8, 0),
    // Top arm, right col (T->B)
    Offset(8, 1), Offset(8, 2), Offset(8, 3), Offset(8, 4), Offset(8, 5),
    // Right arm, top row (L->R)
    Offset(9, 6), Offset(10, 6), Offset(11, 6), Offset(12, 6), Offset(13, 6), Offset(14, 6),
    // Right arm, right col (T->B)
    Offset(14, 7), Offset(14, 8),
    // Right arm, bottom row (R->L)
    Offset(13, 8), Offset(12, 8), Offset(11, 8), Offset(10, 8), Offset(9, 8),
    // Bottom arm, right col (T->B)
    Offset(8, 9), Offset(8, 10), Offset(8, 11), Offset(8, 12), Offset(8, 13), Offset(8, 14),
    // Bottom arm, bottom row (R->L)
    Offset(7, 14), Offset(6, 14),
    // Bottom arm, left col (B->T)
    Offset(6, 13), Offset(6, 12), Offset(6, 11), Offset(6, 10), Offset(6, 9),
    // Left arm, bottom row (R->L)
    Offset(5, 8), Offset(4, 8), Offset(3, 8), Offset(2, 8), Offset(1, 8), Offset(0, 8),
    // Left arm, left col (B->T)
    Offset(0, 7)
  ];

  static const Map<PlayerColor, List<Offset>> finishLanes = {
    PlayerColor.green: [
      Offset(7, 1), Offset(7, 2), Offset(7, 3), Offset(7, 4), Offset(7, 5),
    ],
    PlayerColor.yellow: [
      Offset(13, 7), Offset(12, 7), Offset(11, 7), Offset(10, 7), Offset(9, 7),
    ],
    PlayerColor.blue: [
      Offset(7, 13), Offset(7, 12), Offset(7, 11), Offset(7, 10), Offset(7, 9),
    ],
    PlayerColor.red: [
      Offset(1, 7), Offset(2, 7), Offset(3, 7), Offset(4, 7), Offset(5, 7),
    ],
  };

  static const Map<PlayerColor, int> startIndices = {
    PlayerColor.green: 10,
    PlayerColor.yellow: 23,
    PlayerColor.blue: 36,
    PlayerColor.red: 49,
  };

  /// Returns true if the cell at the given index in `mainTrack` is a safe zone (star).
  static bool isSafeZone(int trackIndex) {
    // 0 is top-left cell of left arm. Let's see if our safe zones match.
    // Safe zones: Start cells (10, 23, 36, 49) + 8 = (18, 31, 44, 5).
    const List<int> safeIndices = [5, 10, 18, 23, 31, 36, 44, 49];
    return safeIndices.contains(trackIndex);
  }

  /// Maps a 1D linear relative position (-1 to 57) for a specific PlayerColor to a 2D grid offset.
  /// 
  /// - `position == -1` means inside the home base. (Returns null, should be rendered specially).
  /// - `position >= 0 && position <= 51` means on the main track.
  /// - `position >= 52 && position <= 56` means inside the finish lane.
  /// - `position == 57` means inside the center finish triangle.
  static Offset? getGridPosition(PlayerColor color, int position) {
    if (position < 0) return null; // Home base
    if (position == 57) return const Offset(7, 7); // Center finish triangle

    if (position <= 51) {
      final startIndex = startIndices[color]!;
      final trackIndex = (startIndex + position) % 52;
      return mainTrack[trackIndex];
    } else if (position <= 56) {
      final laneIndex = position - 52;
      return finishLanes[color]![laneIndex];
    }
    
    return null; // Invalid position
  }
}
