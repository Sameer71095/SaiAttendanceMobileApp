
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double waveHeight = size.height * 0.2;
    final double waveCount = 2.5;

    path.lineTo(0.0, size.height * 0.5);
    for (double i = 0; i <= size.width; i++) {
      path.lineTo(i, waveHeight * -sin(i * waveCount * 2 * pi / size.width) + size.height * 0.5);
    }

    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
