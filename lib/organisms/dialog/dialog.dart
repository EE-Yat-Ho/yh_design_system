import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

final class YHDialog extends StatelessWidget {
  const YHDialog({
    super.key,
    this.titleFont = YHFont.regular16,
    this.subTextFont = YHFont.regular14,
    this.buttonFont = YHFont.regular14,
    required this.text,
    this.subText,
    this.image,
    this.confirmText = "확인",
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
    this.imageWidth,
    this.imageHeight,
    this.buttonInRow = true,
    this.buttonCornerRadius,
    this.buttonTopPadding,
    this.mainColumnCrossAxisAlignment = CrossAxisAlignment.start,
    this.titleAlign = TextAlign.start,
    this.subTextAlign = TextAlign.start,
  });

  final String text;
  final String? subText;
  final YHFont titleFont;
  final YHFont subTextFont;
  final YHFont buttonFont;
  final YHImageInterface? image;
  final double? imageWidth;
  final double? imageHeight;
  final bool buttonInRow;
  final double? buttonCornerRadius;
  final double? buttonTopPadding;
  final CrossAxisAlignment mainColumnCrossAxisAlignment;
  final TextAlign titleAlign;
  final TextAlign subTextAlign;

  final String confirmText;
  final void Function() onConfirm;

  final String? cancelText;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: YHColor.surface05.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        child: Column(
          spacing: 8,
          crossAxisAlignment: mainColumnCrossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              image!.icon(
                width: imageWidth ?? double.infinity,
                height: imageHeight ?? 100,
              ),
            _title(),
            if (subText != null) _subText(),
            SizedBox(height: buttonTopPadding ?? 28),
            if (buttonInRow) _rowButtons(context) else _columnButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return YHText(
        text: text,
        font: titleFont,
        color: YHColor.contentPrimary,
        maxLines: 15,
        align: titleAlign);
  }

  Widget _subText() {
    return YHText(
        text: subText!,
        font: subTextFont,
        color: YHColor.contentSecondary,
        align: subTextAlign);
  }

  Widget _columnButtons(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        if (cancelText != null)
          YHButton(
            cornerRadius: buttonCornerRadius ?? 8,
            borderColor: YHColor.outline,
            borderWidth: 1,
            text: YHText(
                text: cancelText!, font: buttonFont, color: YHColor.black),
            height: 48,
            width: double.infinity,
            backgroundColor: YHColor.white,
            onTap: () {
              Navigator.pop(context);
              if (onCancel != null) {
                onCancel!();
              }
            },
          ),
        YHButton(
          cornerRadius: buttonCornerRadius ?? 8,
          text:
              YHText(text: confirmText, font: buttonFont, color: YHColor.white),
          height: 48,
          width: double.infinity,
          backgroundColor: YHColor.primary,
          onTap: () {
            Navigator.pop(context);
            onConfirm();
          },
        )
      ],
    );
  }

  Widget _rowButtons(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (cancelText != null)
          YHButton(
            cornerRadius: buttonCornerRadius ?? 24,
            borderColor: YHColor.outline,
            borderWidth: 1,
            expands: true,
            text: YHText(
                text: cancelText!, font: buttonFont, color: YHColor.black),
            height: 48,
            backgroundColor: YHColor.white,
            onTap: () {
              Navigator.pop(context);
              if (onCancel != null) {
                onCancel!();
              }
            },
          ),
        YHButton(
          cornerRadius: buttonCornerRadius ?? 24,
          expands: true,
          text:
              YHText(text: confirmText, font: buttonFont, color: YHColor.white),
          height: 48,
          backgroundColor: YHColor.primary,
          onTap: () {
            Navigator.pop(context);
            onConfirm();
          },
        )
      ],
    );
  }
}
