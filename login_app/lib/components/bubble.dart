// BubbleCircle Widget for gradient bubbles
import 'package:flutter/material.dart';

class BubbleCircle extends StatelessWidget {
  final double size;
  final List<Color> colors;

  const BubbleCircle({required this.size, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: colors,
          center: Alignment.center,
          radius: 0.9,
        ),
      ),
    );
  }
}