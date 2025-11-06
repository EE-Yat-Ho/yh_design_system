import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/card/card.dart';
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
    this.leftImage,
    this.leftEmoji,
    this.onTap,
    this.imageColor,
    this.backgroundColor,
    this.cornerRadius = 10,
    this.padding = const EdgeInsets.fromLTRB(16, 14, 16, 14),
  });

  final void Function()? onTap;
  final bool isOn;
  final String title;
  final String description;
  final YHImageInterface? leftImage;
  final String? leftEmoji;
  final Color? backgroundColor;
  final Color? imageColor;
  final double cornerRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    var textColor = isOn ? YHColor.primary : YHColor.textDefault;

    final enable = onTap != null;

    return YHCard(
        backgroundColor: backgroundColor ?? YHColor.surfaceDefault,
        cornerRadius: cornerRadius,
        onTap: enable ? onTap : null,
        useShadow: enable,
        borderColor: enable ? YHColor.strokeDefault : null,
        borderWidth: enable ? 1 : 0,
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (leftImage != null)
              isOn
                  ? leftImage!.icon(color: imageColor)
                  : leftImage!.iconWithOff(color: imageColor),
            if (leftEmoji != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  YHText(
                    text: leftEmoji!,
                    font: YHFont.regular18,
                    color: textColor,
                    align: TextAlign.center,
                  ),
                  YHImage.icon_off_22.icon(width: 18, height: 18),
                ],
              ),
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
