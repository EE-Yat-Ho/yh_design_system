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
    this.imageColor,
    this.imageWidth,
    this.imageHeight,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius,
  });

  final VoidCallback onPressed;
  final double width;
  final double height;
  final YHImage image;
  final YHColor? imageColor;
  final double? imageWidth;
  final double? imageHeight;
  final YHColor? borderColor;
  final double? borderWidth;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    OutlinedBorder? shape;
    if (borderColor != null && borderWidth != null) {
      shape = RoundedRectangleBorder(
        side: BorderSide(color: borderColor!.color, width: borderWidth!),
        borderRadius: BorderRadius.circular(cornerRadius ?? 0),
      );
    }

    return Container(
      padding: const EdgeInsets.all(0.0),
      width: width,
      height: height,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: image.icon(
            width: imageWidth ?? width,
            height: imageHeight ?? height,
            color: imageColor),
        style: IconButton.styleFrom(shape: shape),
      ),
    );
  }
}
