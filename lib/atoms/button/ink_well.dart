import 'package:flutter/material.dart';

class YHInkWell extends StatelessWidget {
  const YHInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.enable = true,
    this.touchAnimation = true,
  });

  final Widget child;
  final void Function()? onTap;
  final bool enable;
  final bool touchAnimation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Container의 Color가 터치 애니메이션을 덮는 것을 방지.
      child: InkWell(
        splashFactory: touchAnimation ? null : NoSplash.splashFactory,
        onTap: enable ? onTap : null,
        child: child,
      ),
    );
  }
}
