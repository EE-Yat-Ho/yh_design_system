import 'package:flutter/material.dart';

class YHInkWell extends StatelessWidget {
  const YHInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.isEnable = true,
  });

  final Widget child;
  final GestureTapCallback onTap;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Container의 Color가 터치 애니메이션을 덮는 것을 방지.
      child: InkWell(
        onTap: isEnable ? onTap : null,
        child: child,
      ),
    );
  }
}
