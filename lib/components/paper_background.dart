import 'package:flutter/material.dart';

class YHPaperBackground extends StatelessWidget {
  const YHPaperBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.png'), // 배경 이미지
          ),
        ),
        child: child);
  }
}
