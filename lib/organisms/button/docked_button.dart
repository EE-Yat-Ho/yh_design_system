import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

// Designed Component
// figma: https://www.figma.com/design/Jw6ccaau53hwdo4bC7stXe/Knock-Design-System?node-id=2360-27460&t=0vQrnYnUYwwpJjMZ-0

class YHDockedButton extends StatelessWidget {
  const YHDockedButton({
    super.key,
    required this.onTapRight,
    this.rightText = "확인",
    this.rightBackgroundColor,
    this.rightTextColor = YHColor.contentTertiary,
    this.rightBorderColor,
    this.rightEnabled = true,
    this.onTapLeft,
    this.leftText = "취소",
    this.leftBackgroundColor = YHColor.surface05,
    this.leftTextColor = YHColor.contentPrimary,
    this.leftBorderColor = YHColor.outline,
  });

  final void Function() onTapRight;
  final String? rightText;
  final YHColor? rightBackgroundColor;
  final YHColor rightTextColor;
  final YHColor? rightBorderColor;
  final bool rightEnabled;
  final void Function()? onTapLeft;
  final String? leftText;
  final YHColor leftBackgroundColor;
  final YHColor leftTextColor;
  final YHColor? leftBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            YHColor.white.color,
            YHColor.white.color.withValues(alpha: 0),
          ],
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          if (onTapLeft != null)
            YHButton(
              expands: true,
              backgroundColor: leftBackgroundColor,
              onTap: onTapLeft!,
              borderColor: leftBorderColor,
              borderWidth: leftBorderColor != null ? 1 : 0,
              cornerRadius: 12,
              padding: const EdgeInsets.symmetric(vertical: 16),
              text: YHText(
                  text: leftText!,
                  font: YHFont.regular16,
                  color: leftTextColor,
                  align: TextAlign.center),
            ),
          YHButton(
            expands: true,
            backgroundColor: rightBackgroundColor ?? YHColor.primary,
            onTap: rightEnabled ? onTapRight : null,
            borderColor: rightBorderColor,
            borderWidth: rightBorderColor != null ? 1 : 0,
            cornerRadius: 12,
            padding: const EdgeInsets.symmetric(vertical: 16),
            text: YHText(
                text: rightText!,
                font: YHFont.regular16,
                color: rightTextColor,
                align: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
