import 'package:flutter/material.dart';

final class YHInkWell extends StatelessWidget {
  const YHInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.enable = true,
    this.touchAnimation = true,
    this.cornerRadius = 0,
  });

  final Widget child;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool enable;
  final bool touchAnimation;
  final double cornerRadius;

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   color: Colors.transparent, // Container의 Color가 터치 애니메이션을 덮는 것을 방지.
    //   clipBehavior: cornerRadius > 0 ? Clip.antiAlias : Clip.none,
    //   borderRadius:
    //       cornerRadius > 0 ? BorderRadius.circular(cornerRadius) : null,
    //   child: InkWell(
    //     splashFactory: touchAnimation ? null : NoSplash.splashFactory,
    //     borderRadius:
    //         cornerRadius > 0 ? BorderRadius.circular(cornerRadius) : null,
    //     onTap: enable ? onTap : null,
    //     onLongPress: enable ? onLongPress : null,
    //     child: child,
    //   ),
    // );

    return Ink(
      decoration: BoxDecoration(
        color: Colors.transparent, // Container의 Color가 터치 애니메이션을 덮는 것을 방지.
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: InkWell(
        splashFactory: touchAnimation ? null : NoSplash.splashFactory,
        borderRadius: BorderRadius.circular(cornerRadius),
        onTap: enable ? onTap : null,
        onLongPress: enable ? onLongPress : null,
        child: child,
      ),
    );
  }
}
