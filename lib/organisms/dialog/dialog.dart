import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHDialog extends StatelessWidget {
  const YHDialog({
    super.key,
    required this.text,
    this.subText,
    this.image,
    this.confirmText = "확인",
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  final String text;
  final String? subText;
  final YHImage? image;

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
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _title(),
            if (image != null) image!.icon(width: 48, height: 48),
            if (subText != null) _subText(),
            const SizedBox(height: 28),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return YHText(
        text: text,
        font: YHFont.regular16,
        color: YHColor.contentPrimary,
        align: TextAlign.start);
  }

  Widget _subText() {
    return YHText(
        text: subText!,
        font: YHFont.regular14,
        color: YHColor.contentSecondary,
        align: TextAlign.start);
  }

  Widget _buttons(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (cancelText != null)
          YHButton(
            borderColor: YHColor.outline,
            borderWidth: 1,
            expands: true,
            text: YHText(
                text: cancelText!,
                font: YHFont.regular14,
                color: YHColor.black),
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
          expands: true,
          text: YHText(
              text: confirmText, font: YHFont.regular14, color: YHColor.white),
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
