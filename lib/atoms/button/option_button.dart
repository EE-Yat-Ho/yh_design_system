import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

final class YHOptionButton extends StatelessWidget {
  const YHOptionButton({
    super.key,
    required this.title,
    required this.description,
    required this.isOn,
    required this.image,
    required this.onTap,
    this.imageColor,
    this.backgroundColor,
    this.enableElevation = 3,
    this.cornerRadius = 10,
    this.padding = const EdgeInsets.fromLTRB(16, 14, 16, 14),
    this.enable = true,
  });

  final VoidCallback onTap;
  final bool isOn;
  final String title;
  final String description;
  final YHImageInterface image;
  final Color? backgroundColor;
  final double enableElevation;
  final Color? imageColor;
  final double cornerRadius;
  final EdgeInsets padding;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    var textColor = isOn ? YHColor.primary : YHColor.textDefault;

    return ElevatedButton(
        onPressed: enable ? onTap : null,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor ?? YHColor.surfaceDefault,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          elevation: enable ? enableElevation : 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isOn
                ? image.icon(color: imageColor)
                : image.iconWithOff(color: imageColor),
            const SizedBox(width: 10),
            YHText(
              text: title,
              font: YHFont.regular16,
              color: textColor,
            ),
            const Spacer(),
            YHText(
              text: description,
              font: YHFont.regular16,
              color: textColor,
            ),
          ],
        ));
  }
}
