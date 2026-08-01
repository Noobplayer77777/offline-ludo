import 'package:flutter/material.dart';

class LoopingPulse extends StatefulWidget {
  final Widget child;
  final double minScale;
  final double maxScale;
  final Duration duration;

  const LoopingPulse({
    super.key,
    required this.child,
    this.minScale = 1.0,
    this.maxScale = 1.1,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<LoopingPulse> createState() => _LoopingPulseState();
}

class _LoopingPulseState extends State<LoopingPulse> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: widget.minScale, end: widget.maxScale).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class LoopingFade extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const LoopingFade({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<LoopingFade> createState() => _LoopingFadeState();
}

class _LoopingFadeState extends State<LoopingFade> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: widget.child,
    );
  }
}
