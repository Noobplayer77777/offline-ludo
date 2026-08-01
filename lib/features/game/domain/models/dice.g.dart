// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Dice _$DiceFromJson(Map<String, dynamic> json) => _Dice(
  value: (json['value'] as num?)?.toInt() ?? 1,
  isRolling: json['isRolling'] as bool? ?? false,
);

Map<String, dynamic> _$DiceToJson(_Dice instance) => <String, dynamic>{
  'value': instance.value,
  'isRolling': instance.isRolling,
};
