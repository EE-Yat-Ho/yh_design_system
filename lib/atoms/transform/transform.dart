import 'package:flutter/material.dart';

class YHTransform extends StatelessWidget {
  const YHTransform({
    super.key,
    required this.child,
    this.angle = 0, // 0 ~ 360도
    this.offset = Offset.zero,
  });

  final Widget child;
  final double angle;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    const pie = 3.14;
    return Transform(
      transform: Matrix4.identity()
        ..translate(offset.dx, offset.dy)
        ..rotateZ(2 * pie * angle / 360), // 30도 회전 (라디안 값으로 π/6)
      origin: offset,
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
