import 'package:flutter/animation.dart';

class LudoAnimations {
  // Durations
  static const Duration hopDuration = Duration(milliseconds: 250);
  static const Duration diceRollDuration = Duration(milliseconds: 800);
  static const Duration captureSlideDuration = Duration(milliseconds: 400);
  static const Duration captureShrinkDuration = Duration(milliseconds: 200);
  
  // Curves
  static const Curve hopCurve = Curves.easeOutQuad;
  static const Curve captureSlideCurve = Curves.easeInOutBack;
}
