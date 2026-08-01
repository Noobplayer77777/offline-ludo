import 'package:flutter_test/flutter_test.dart';
import 'package:offline_ludo/features/game/domain/board/coordinate_mapper.dart';
import 'package:offline_ludo/features/game/domain/board/path_generator.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

void main() {
  group('Board Mapping and Path Generation Tests', () {
    test('mainTrack has exactly 52 cells', () {
      expect(PathGenerator.mainTrack.length, 52);
    });

    test('All finish lanes have exactly 5 cells', () {
      for (var color in PlayerColor.values) {
        expect(PathGenerator.finishLanes[color]!.length, 5);
      }
    });

    test('Home bases have correct indices', () {
      // Start cells + 8 should be safe zones
      final greenStart = PathGenerator.startIndices[PlayerColor.green]!;
      expect(PathGenerator.isSafeZone(greenStart), true);
      expect(PathGenerator.isSafeZone((greenStart + 8) % 52), true);

      final redStart = PathGenerator.startIndices[PlayerColor.red]!;
      expect(PathGenerator.isSafeZone(redStart), true);
      expect(PathGenerator.isSafeZone((redStart + 8) % 52), true);
    });

    test('getGridPosition maps correctly', () {
      // Relative position 0 is start cell for RED
      final redStartCell = PathGenerator.getGridPosition(PlayerColor.red, 0);
      expect(redStartCell, PathGenerator.mainTrack[PathGenerator.startIndices[PlayerColor.red]!]);

      // Relative position 51 is last cell before finish lane for RED
      final redLastMainTrackCell = PathGenerator.getGridPosition(PlayerColor.red, 51);
      final expectedIndex = (PathGenerator.startIndices[PlayerColor.red]! + 51) % 52;
      expect(redLastMainTrackCell, PathGenerator.mainTrack[expectedIndex]);

      // Relative position 52 is first cell of finish lane
      final redFirstFinishCell = PathGenerator.getGridPosition(PlayerColor.red, 52);
      expect(redFirstFinishCell, PathGenerator.finishLanes[PlayerColor.red]![0]);

      // Relative position 57 is center triangle
      final center = PathGenerator.getGridPosition(PlayerColor.red, 57);
      expect(center, const Offset(7, 7));

      // Home base
      final homeBase = PathGenerator.getGridPosition(PlayerColor.red, -1);
      expect(homeBase, isNull);
    });

    test('CoordinateMapper maps correctly', () {
      final mapper = CoordinateMapper(boardSize: 150);
      // 150 / 15 = 10 pixels per cell
      
      final cellCenter = mapper.getCenterForGrid(const Offset(0, 0));
      expect(cellCenter, const Offset(5, 5));

      final greenHomeCenter = mapper.getHomeBaseCenter(PlayerColor.green);
      // Green is top-left, center of 6x6 is 3, 3 but offset by 0.5 for actual center? 
      // Actually it's 2.5, 2.5 * 10 + 5 = 25 + 5 = 30? Wait.
      // 2.5 * 10 = 25. + 5 = 30.
      expect(greenHomeCenter, const Offset(30, 30));
    });
  });
}
