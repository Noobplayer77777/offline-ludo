import 'package:flutter/material.dart';
import 'package:offline_ludo/features/game/domain/board/board_geometry.dart';
import 'package:offline_ludo/features/game/domain/board/path_generator.dart';
import 'package:offline_ludo/features/game/domain/models/player.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';

class LudoBoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cellSize = size.width / BoardGeometry.gridSize;

    // Paints
    final Paint borderPaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Paint fillPaint = Paint()..style = PaintingStyle.fill;

    // Draw Transparent Glass Background for entire board
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), 
      Paint()..color = AppColors.background.withValues(alpha: 0.7));

    // 1. Draw 4 Home Bases
    _drawHomeBase(canvas, PlayerColor.green, 0, 0, cellSize, fillPaint, borderPaint);
    _drawHomeBase(canvas, PlayerColor.yellow, 9, 0, cellSize, fillPaint, borderPaint);
    _drawHomeBase(canvas, PlayerColor.blue, 9, 9, cellSize, fillPaint, borderPaint);
    _drawHomeBase(canvas, PlayerColor.red, 0, 9, cellSize, fillPaint, borderPaint);

    // 2. Draw Track Cells
    for (int i = 0; i < PathGenerator.mainTrack.length; i++) {
      final offset = PathGenerator.mainTrack[i];
      final rect = Rect.fromLTWH(
        offset.dx * cellSize, 
        offset.dy * cellSize, 
        cellSize, 
        cellSize,
      );

      // Check if it's a start cell
      Color? cellColor;
      if (i == PathGenerator.startIndices[PlayerColor.green]) cellColor = BoardGeometry.getColorForPlayer(PlayerColor.green);
      if (i == PathGenerator.startIndices[PlayerColor.yellow]) cellColor = BoardGeometry.getColorForPlayer(PlayerColor.yellow);
      if (i == PathGenerator.startIndices[PlayerColor.blue]) cellColor = BoardGeometry.getColorForPlayer(PlayerColor.blue);
      if (i == PathGenerator.startIndices[PlayerColor.red]) cellColor = BoardGeometry.getColorForPlayer(PlayerColor.red);

      if (cellColor != null) {
        fillPaint.color = cellColor;
        canvas.drawRect(rect, fillPaint);
      }

      // Draw safe zone indicator
      if (PathGenerator.isSafeZone(i)) {
        if (cellColor == null) {
          fillPaint.color = AppColors.primary.withValues(alpha: 0.1);
          canvas.drawRect(rect, fillPaint);
        }
        _drawStar(canvas, rect.center, cellSize * 0.3);
      }

      canvas.drawRect(rect, borderPaint);
    }

    // 3. Draw Finish Lanes
    for (var color in PlayerColor.values) {
      fillPaint.color = BoardGeometry.getColorForPlayer(color);
      final lane = PathGenerator.finishLanes[color]!;
      for (var offset in lane) {
        final rect = Rect.fromLTWH(
          offset.dx * cellSize, 
          offset.dy * cellSize, 
          cellSize, 
          cellSize,
        );
        canvas.drawRect(rect, fillPaint);
        canvas.drawRect(rect, borderPaint);
      }
    }

    // 4. Draw Center Finish Triangles
    _drawCenter(canvas, size.width / 2, size.height / 2, cellSize * 1.5);
  }

  void _drawHomeBase(Canvas canvas, PlayerColor color, double gridX, double gridY, double cellSize, Paint fillPaint, Paint borderPaint) {
    final double x = gridX * cellSize;
    final double y = gridY * cellSize;
    final double size = BoardGeometry.homeSize * cellSize;
    
    // Outer colored square
    fillPaint.color = BoardGeometry.getColorForPlayer(color);
    canvas.drawRect(Rect.fromLTWH(x, y, size, size), fillPaint);
    canvas.drawRect(Rect.fromLTWH(x, y, size, size), borderPaint);

    // Inner dark square
    final double innerMargin = cellSize * 0.75;
    fillPaint.color = AppColors.background.withValues(alpha: 0.9);
    canvas.drawRect(
      Rect.fromLTWH(x + innerMargin, y + innerMargin, size - innerMargin * 2, size - innerMargin * 2), 
      fillPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(x + innerMargin, y + innerMargin, size - innerMargin * 2, size - innerMargin * 2), 
      borderPaint,
    );

    // 4 Token resting circles
    final double circleRadius = cellSize * 0.6;
    final double centerOffset = size / 2;
    final double distance = cellSize * 1.2;

    fillPaint.color = BoardGeometry.getLightColorForPlayer(color);
    final offsets = [
      Offset(x + centerOffset - distance, y + centerOffset - distance),
      Offset(x + centerOffset + distance, y + centerOffset - distance),
      Offset(x + centerOffset - distance, y + centerOffset + distance),
      Offset(x + centerOffset + distance, y + centerOffset + distance),
    ];

    for (var offset in offsets) {
      canvas.drawCircle(offset, circleRadius, fillPaint);
      canvas.drawCircle(offset, circleRadius, borderPaint);
    }
  }

  void _drawCenter(Canvas canvas, double cx, double cy, double halfSize) {
    // Red triangle (bottom-left facing right... wait, center is divided into 4 triangles)
    // Actually the standard center is 4 triangles meeting at the center.
    // Top = Green, Right = Yellow, Bottom = Blue, Left = Red
    
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    void drawTriangle(Color color, Offset p1, Offset p2, Offset p3) {
      paint.color = color;
      final path = Path()..moveTo(p1.dx, p1.dy)..lineTo(p2.dx, p2.dy)..lineTo(p3.dx, p3.dy)..close();
      canvas.drawPath(path, paint);
      canvas.drawPath(path, borderPaint);
    }

    final center = Offset(cx, cy);
    final topLeft = Offset(cx - halfSize, cy - halfSize);
    final topRight = Offset(cx + halfSize, cy - halfSize);
    final bottomLeft = Offset(cx - halfSize, cy + halfSize);
    final bottomRight = Offset(cx + halfSize, cy + halfSize);

    // Green (Top)
    drawTriangle(BoardGeometry.getColorForPlayer(PlayerColor.green), topLeft, topRight, center);
    // Yellow (Right)
    drawTriangle(BoardGeometry.getColorForPlayer(PlayerColor.yellow), topRight, bottomRight, center);
    // Blue (Bottom)
    drawTriangle(BoardGeometry.getColorForPlayer(PlayerColor.blue), bottomLeft, bottomRight, center);
    // Red (Left)
    drawTriangle(BoardGeometry.getColorForPlayer(PlayerColor.red), topLeft, bottomLeft, center);
  }

  void _drawStar(Canvas canvas, Offset center, double radius) {
    final Paint starPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    // A simple 4-point or 5-point star. Let's do a cross for simplicity as a safe zone marker
    path.moveTo(center.dx - radius, center.dy - radius);
    path.lineTo(center.dx + radius, center.dy + radius);
    path.moveTo(center.dx + radius, center.dy - radius);
    path.lineTo(center.dx - radius, center.dy + radius);
    canvas.drawPath(path, starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
