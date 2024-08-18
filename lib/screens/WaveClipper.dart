import 'package:flutter/material.dart';

// Is used to clip Contianer in wave pattern dont mess with it
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 60);

    // First curve (downward)
    path.quadraticBezierTo(
        size.width / 4, size.height - 100, size.width / 2, size.height - 60);

    // Second curve (upward)
    path.quadraticBezierTo(
        3 * size.width / 4, size.height - 20, size.width, size.height - 60);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
