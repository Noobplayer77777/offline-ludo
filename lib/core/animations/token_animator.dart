import 'package:flutter/material.dart';
import 'package:offline_ludo/core/animations/ludo_animations.dart';
import 'package:offline_ludo/features/game/domain/board/board_geometry.dart';
import 'package:offline_ludo/features/game/domain/models/token.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';

class TokenAnimator extends StatefulWidget {
  final Token token;
  final PlayerColor color;
  final int tokenIndex;
  final double cellSize;
  final VoidCallback onTap;

  const TokenAnimator({
    super.key,
    required this.token,
    required this.color,
    required this.tokenIndex,
    required this.cellSize,
    required this.onTap,
  });

  @override
  State<TokenAnimator> createState() => _TokenAnimatorState();
}

class _TokenAnimatorState extends State<TokenAnimator> with TickerProviderStateMixin {
  late AnimationController _hopController;
  late AnimationController _captureController;
  
  Offset _currentOffset = Offset.zero;
  
  // For hopping sequence
  final List<int> _hopQueue = [];
  bool _isHopping = false;
  
  // Capture effect
  bool _isCaptured = false;

  @override
  void initState() {
    super.initState();
    _currentOffset = BoardGeometry.getTokenPosition(widget.token, widget.color, widget.tokenIndex);
    
    _hopController = AnimationController(
      vsync: this,
      duration: LudoAnimations.hopDuration,
    );
    
    _captureController = AnimationController(
      vsync: this,
      duration: LudoAnimations.captureShrinkDuration,
    );
    
    _hopController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _processNextHop();
      }
    });
  }

  @override
  void didUpdateWidget(covariant TokenAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.token.position != widget.token.position) {
      final oldPos = oldWidget.token.position;
      final newPos = widget.token.position;
      
      if (newPos == -1 && oldPos != -1) {
        // Captured!
        _triggerCaptureAnimation(oldPos);
      } else if (oldPos == -1 && newPos == 0) {
        // Exiting home (just a single hop/slide)
        _enqueueHop(0);
      } else if (newPos > oldPos && oldPos != -1) {
        // Normal forward movement
        for (int i = oldPos + 1; i <= newPos; i++) {
          _enqueueHop(i);
        }
      } else {
        // Fallback: direct jump (e.g. state resync)
        setState(() {
          _currentOffset = BoardGeometry.getTokenPosition(widget.token, widget.color, widget.tokenIndex);
        });
      }
    }
  }
  
  void _enqueueHop(int pos) {
    _hopQueue.add(pos);
    if (!_isHopping) {
      _processNextHop();
    }
  }
  
  void _processNextHop() {
    if (_hopQueue.isEmpty) {
      _isHopping = false;
      return;
    }
    
    _isHopping = true;
    final nextPos = _hopQueue.removeAt(0);
    
    // Create a mock token to calculate target offset
    final tempToken = Token(id: widget.token.id, ownerId: widget.token.ownerId, position: nextPos);
    final targetOffset = BoardGeometry.getTokenPosition(tempToken, widget.color, widget.tokenIndex);
    
    setState(() {
      _currentOffset = targetOffset;
    });
    
    _hopController.forward(from: 0.0);
  }
  
  void _triggerCaptureAnimation(int currentPos) async {
    setState(() {
      _isCaptured = true;
    });
    
    await _captureController.forward();
    
    setState(() {
      _currentOffset = BoardGeometry.getTokenPosition(widget.token, widget.color, widget.tokenIndex);
    });
    
    await _captureController.reverse();
    
    setState(() {
      _isCaptured = false;
    });
  }

  @override
  void dispose() {
    _hopController.dispose();
    _captureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: _isCaptured ? LudoAnimations.captureSlideDuration : LudoAnimations.hopDuration,
      curve: _isCaptured ? LudoAnimations.captureSlideCurve : LudoAnimations.hopCurve,
      left: _currentOffset.dx * widget.cellSize,
      top: _currentOffset.dy * widget.cellSize,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isCaptured ? 0.0 : 1.0,
          duration: LudoAnimations.captureShrinkDuration,
          child: Container(
            width: widget.cellSize,
            height: widget.cellSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: BoardGeometry.getColorForPlayer(widget.color),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
