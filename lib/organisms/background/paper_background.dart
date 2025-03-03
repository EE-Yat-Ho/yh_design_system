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
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/paper_background.png'), // 배경 이미지
          ),
        ),
        child: child);
  }
}
