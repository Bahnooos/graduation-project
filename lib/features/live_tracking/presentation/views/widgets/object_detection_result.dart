

import 'package:flutter/material.dart';

class ObjectDetectionResult {
  final Rect rect;
  final double score;
  final String classLabel;

  ObjectDetectionResult({
    required this.rect,
    required this.score,
    required this.classLabel,
  });
}

class BoundingBoxPainter extends CustomPainter {
  final List<ObjectDetectionResult> results;
  final Size previewSize;

  BoundingBoxPainter({
    required this.results,
    required this.previewSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / previewSize.width;
    final scaleY = size.height / previewSize.height;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.red;

    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (var result in results) {
      final rect = Rect.fromLTRB(
        result.rect.left * scaleX,
        result.rect.top * scaleY,
        result.rect.right * scaleX,
        result.rect.bottom * scaleY,
      );

      // Draw bounding box
      canvas.drawRect(rect, paint);

      // Draw label background
      final textSpan = TextSpan(
        text: '${result.classLabel} ${(result.score * 100).toStringAsFixed(1)}%',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          backgroundColor: Colors.red,
        ),
      );

      textPainter.text = textSpan;
      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(rect.left, rect.top - textPainter.height),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
