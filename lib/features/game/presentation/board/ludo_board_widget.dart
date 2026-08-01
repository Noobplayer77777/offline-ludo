import 'package:flutter/material.dart';
import 'package:offline_ludo/features/game/presentation/board/ludo_board_painter.dart';

class LudoBoardWidget extends StatelessWidget {
  const LudoBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AspectRatio(
          aspectRatio: 1.0, // Board is perfectly square
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border.all(color: Colors.black87, width: 2),
                ),
                child: CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: LudoBoardPainter(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
