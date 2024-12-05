import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHImageButton extends StatelessWidget {
  const YHImageButton({
    super.key,
    required this.image,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
  });

  final VoidCallback onPressed;
  final YHImage image;
  final double width;
  final double height;
  final YHColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      width: width,
      height: height,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: image.icon(width: width, height: height, color: color),
      ),
    );
  }
}
