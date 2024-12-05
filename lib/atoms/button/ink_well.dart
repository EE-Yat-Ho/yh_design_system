import 'package:flutter/material.dart';

class YHInkWell extends StatelessWidget {
  const YHInkWell({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Container의 Color가 터치 애니메이션을 덮는 것을 방지.
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
