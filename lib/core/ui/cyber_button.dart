import 'package:flutter/material.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';

class CyberButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final bool isPrimary;
  final bool isLoading;

  const CyberButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isPrimary = true,
    this.isLoading = false,
  });

  @override
  State<CyberButton> createState() => _CyberButtonState();
}

class _CyberButtonState extends State<CyberButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) => _controller.forward();
  void _onTapUp(TapUpDetails details) => _controller.reverse();
  void _onTapCancel() => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    final color = widget.isPrimary ? AppColors.primary : AppColors.secondary;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: widget.isLoading ? null : _onTapDown,
        onTapUp: widget.isLoading ? null : _onTapUp,
        onTapCancel: widget.isLoading ? null : _onTapCancel,
        onTap: widget.isLoading ? null : () {
          _controller.forward().then((_) {
            _controller.reverse();
            widget.onPressed();
          });
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
            decoration: BoxDecoration(
              color: _isHovered ? color.withOpacity(0.15) : color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isHovered ? color : color.withOpacity(0.5),
                width: 2,
              ),
              boxShadow: [
                if (_isHovered)
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
              ],
            ),
            child: widget.isLoading 
              ? SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: color, strokeWidth: 2),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(widget.icon, color: color),
                    const SizedBox(width: 12),
                    Text(
                      widget.label.toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
