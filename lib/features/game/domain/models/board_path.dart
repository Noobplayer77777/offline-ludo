import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_path.freezed.dart';
part 'board_path.g.dart';

@freezed
abstract class BoardPath with _$BoardPath {
  const factory BoardPath({
    required List<int> safeZones,
    required int totalTrackLength,
  }) = _BoardPath;

  factory BoardPath.fromJson(Map<String, dynamic> json) => _$BoardPathFromJson(json);

  // Standard Ludo configuration
  factory BoardPath.standard() {
    return const BoardPath(
      safeZones: [0, 8, 13, 21, 26, 34, 39, 47], // Typical safe spots
      totalTrackLength: 52,
    );
  }
}
