import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHFloatingButton extends StatefulWidget {
  const YHFloatingButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final YHImageInterface image;

  @override
  State<YHFloatingButton> createState() => _YHFloatingButtonState();
}

class _YHFloatingButtonState extends State<YHFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 52,
      child: FittedBox(
        child: FloatingActionButton(
          shape: const CircleBorder(),
          foregroundColor: YHColor.white.color,
          backgroundColor: YHColor.primary.color,
          onPressed: widget.onTap,
          child: widget.image.icon(),
        ),
      ),
    );
  }
}
