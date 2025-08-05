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
    this.backgroundColor = YHColor.white,
    this.elevation = 3,
  });

  final VoidCallback onTap;
  final bool isOn;
  final String title;
  final String description;
  final YHImageInterface image;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    var textColor = isOn ? YHColor.primary : YHColor.black;

    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
          elevation: elevation,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconStack(),
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

  Stack iconStack() {
    return Stack(
      children: isOn
          ? [
              image.icon(),
            ]
          : [
              image.icon(),
              YHImage.icon_off_22.icon(),
            ],
    );
  }
}
