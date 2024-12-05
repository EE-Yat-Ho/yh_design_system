import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/images.dart';

class YHFloatingButton extends StatefulWidget {
  const YHFloatingButton({
    super.key,
    required this.image,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final YHImage image;

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
          onPressed: widget.onPressed,
          child: widget.image.icon(),
        ),
      ),
    );
  }
}
