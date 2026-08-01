import 'dart:math';
import 'package:flutter/material.dart';
import 'package:offline_ludo/core/audio/audio_manager.dart';
import 'package:offline_ludo/core/animations/ludo_animations.dart';

class DiceAnimator extends StatefulWidget {
  final int value;
  final bool hasRolled;

  const DiceAnimator({
    super.key,
    required this.value,
    required this.hasRolled,
  });

  @override
  State<DiceAnimator> createState() => _DiceAnimatorState();
}

class _DiceAnimatorState extends State<DiceAnimator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  
  int _displayValue = 1;

  @override
  void initState() {
    super.initState();
    _displayValue = widget.value;
    _controller = AnimationController(
      vsync: this,
      duration: LudoAnimations.diceRollDuration,
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.2), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 0.2, end: -0.2), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -0.2, end: 0.0), weight: 1),
    ]).animate(_controller);

    _controller.addListener(() {
      if (_controller.isAnimating) {
        // Change display value rapidly while shaking
        final randomVal = Random().nextInt(6) + 1;
        if (randomVal != _displayValue) {
          setState(() {
            _displayValue = randomVal;
          });
        }
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _displayValue = widget.value;
        });
      }
    });
    
    if (widget.hasRolled) {
      _startRollAnimation();
    }
  }

  void _startRollAnimation() {
    AudioManager.instance.playSfx('audio/sfx_dice.mp3');
    _controller.forward(from: 0.0);
  }

  @override
  void didUpdateWidget(covariant DiceAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasRolled && !oldWidget.hasRolled) {
      _startRollAnimation();
    } else if (widget.hasRolled && oldWidget.hasRolled && widget.value != oldWidget.value) {
      // Re-rolled somehow (e.g. got a 6)
      _startRollAnimation();
    } else if (!widget.hasRolled) {
      setState(() {
        _displayValue = widget.value;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.hasRolled && !_controller.isAnimating) {
      return _buildDiceFace(widget.value);
    }

    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _shakeAnimation.value,
          child: _buildDiceFace(_displayValue),
        );
      },
    );
  }

  Widget _buildDiceFace(int val) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          val.toString(),
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
