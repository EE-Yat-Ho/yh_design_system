import "package:flutter/material.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/row/row.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/font/fonts.dart";

final class GuideMessage extends StatelessWidget {
  const GuideMessage({
    super.key,
    required this.message,
    this.padding = const EdgeInsets.all(24),
  });

  final String message;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return YHRow(
      padding: padding,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        YHImage.icon_information_24.icon(),
        const SizedBox(width: 8),
        Expanded(
          child: YHText(
            text: message,
            font: YHFont.regular14,
            color: YHColor.contentSecondary,
          ),
        ),
      ],
    );
  }
}
