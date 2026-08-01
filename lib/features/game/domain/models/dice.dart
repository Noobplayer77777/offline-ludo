import 'package:freezed_annotation/freezed_annotation.dart';

part 'dice.freezed.dart';
part 'dice.g.dart';

@freezed
abstract class Dice with _$Dice {
  const Dice._();

  const factory Dice({
    @Default(1) int value,
    @Default(false) bool isRolling,
  }) = _Dice;

  factory Dice.fromJson(Map<String, dynamic> json) => _$DiceFromJson(json);

  // Validation
  void validate() {
    if (value < 1 || value > 6) {
      throw ArgumentError('Dice value must be between 1 and 6, got $value');
    }
  }
}
