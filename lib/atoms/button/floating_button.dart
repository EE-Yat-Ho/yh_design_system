import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHFloatingButton extends StatefulWidget {
  const YHFloatingButton({
    super.key,
    required this.image,
    required this.onTap,
    this.width = 52,
    this.height = 52,
    this.imageColor,
    this.backgroundColor,
  });

  final double width;
  final double height;
  final YHColor? imageColor;
  final YHColor? backgroundColor;
  final VoidCallback? onTap;
  final YHImageInterface image;

  @override
  State<YHFloatingButton> createState() => _YHFloatingButtonState();
}

class _YHFloatingButtonState extends State<YHFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: FittedBox(
        child: FloatingActionButton(
          shape: const CircleBorder(),
          foregroundColor: widget.imageColor?.color,
          backgroundColor: widget.backgroundColor?.color,
          onPressed: widget.onTap,
          child: widget.image.icon(color: widget.imageColor),
        ),
      ),
    );
  }
}
