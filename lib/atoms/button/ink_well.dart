import 'package:flutter/material.dart';

final class YHInkWell extends StatelessWidget {
  const YHInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.enable = true,
    this.touchAnimation = true,
    this.cornerRadius = 20,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool enable;
  final bool touchAnimation;
  final double cornerRadius;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Container의 Color가 터치 애니메이션을 덮는 것을 방지.
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: InkWell(
        splashFactory: touchAnimation ? null : NoSplash.splashFactory,
        onTap: enable ? onTap : null,
        onLongPress: enable ? onLongPress : null,
        child: Container(padding: padding, child: child),
      ),
    );
  }
}
