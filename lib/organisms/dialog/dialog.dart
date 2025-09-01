import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/column/column.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

enum ButtonDirection {
  vertical,
  horizontal,
}

final class YHDialog extends StatelessWidget {
  const YHDialog({
    super.key,
    this.titleFont = YHFont.regular16,
    this.subTextFont = YHFont.regular14,
    this.buttonFont = YHFont.regular14,
    required this.text,
    this.subText,
    this.image,
    this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
    this.imageWidth,
    this.imageHeight,
    this.imageBottomPadding,
    this.buttonDirection = ButtonDirection.vertical,
    this.buttonCornerRadius,
    this.buttonTopPadding,
    this.columnMainAxisAlignment = MainAxisAlignment.center,
    this.columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.columnMainAxisSize = MainAxisSize.min,
    this.titleAlign = TextAlign.center,
    this.subTextAlign = TextAlign.center,
    this.confirmButtonBackgroundColor,
  });

  final String text;
  final String? subText;
  final YHFont titleFont;
  final YHFont subTextFont;
  final YHFont buttonFont;
  final YHImageInterface? image;
  final double? imageWidth;
  final double? imageHeight;
  final double? imageBottomPadding;
  final ButtonDirection buttonDirection;
  final double? buttonCornerRadius;
  final double? buttonTopPadding;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final MainAxisSize columnMainAxisSize;
  final TextAlign titleAlign;
  final TextAlign subTextAlign;
  final Color? confirmButtonBackgroundColor;

  final String? confirmText;
  final void Function() onConfirm;

  final String? cancelText;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    final double topPadding = image == null ? 20 : 16;

    return Dialog(
      backgroundColor: YHColor.surfaceDefault,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: YHColumn(
        padding: EdgeInsets.fromLTRB(20, topPadding, 20, 20),
        crossAxisAlignment: columnCrossAxisAlignment,
        mainAxisAlignment: columnMainAxisAlignment,
        mainAxisSize: columnMainAxisSize,
        children: [
          if (image != null) ...[
            image!.icon(
              width: imageWidth ?? double.infinity,
              height: imageHeight ?? 100,
            ),
            SizedBox(height: imageBottomPadding ?? 16),
          ],
          _title(),
          if (subText != null) ...[
            const SizedBox(height: 8),
            _subText(),
          ],
          SizedBox(height: buttonTopPadding ?? 24),
          if (buttonDirection == ButtonDirection.horizontal)
            _rowButtons(context)
          else
            _columnButtons(context)
        ],
      ),
    );
  }

  Widget _title() {
    return YHText(
        text: text,
        font: titleFont,
        color: YHColor.textDefault,
        maxLines: 15,
        align: titleAlign);
  }

  Widget _subText() {
    return YHText(
        text: subText!,
        font: subTextFont,
        color: YHColor.textSub,
        maxLines: 15,
        align: subTextAlign);
  }

  Widget _rowButtons(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (cancelText != null)
          YHButton(
            cornerRadius: buttonCornerRadius ?? 8,
            borderColor: YHColor.surfaceSub,
            borderWidth: 1,
            expands: true,
            text: YHText(
                text: cancelText!,
                font: buttonFont,
                color: YHColor.textDefault),
            height: 48,
            backgroundColor: YHColor.surfaceDefault,
            onTap: () {
              Navigator.pop(context, false);
              if (onCancel != null) {
                onCancel!();
              }
            },
          ),
        YHButton(
          cornerRadius: buttonCornerRadius ?? 8,
          expands: true,
          text: YHText(
              text: confirmText ?? 'common.confirm'.tr(),
              font: buttonFont,
              color: YHColor.textWhite),
          height: 48,
          backgroundColor: confirmButtonBackgroundColor ?? YHColor.primary,
          onTap: () {
            Navigator.pop(context, true);
            onConfirm();
          },
        )
      ],
    );
  }

  Widget _columnButtons(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        if (cancelText != null)
          YHButton(
            cornerRadius: buttonCornerRadius ?? 24,
            borderColor: YHColor.surfaceSub,
            borderWidth: 1,
            text: YHText(
                text: cancelText!,
                font: buttonFont,
                color: YHColor.textDefault),
            height: 48,
            width: double.infinity,
            backgroundColor: YHColor.surfaceDefault,
            onTap: () {
              Navigator.pop(context, false);
              if (onCancel != null) {
                onCancel!();
              }
            },
          ),
        YHButton(
          cornerRadius: buttonCornerRadius ?? 24,
          text: YHText(
              text: confirmText ?? 'common.confirm'.tr(),
              font: buttonFont,
              color: YHColor.textWhite),
          height: 48,
          width: double.infinity,
          backgroundColor: confirmButtonBackgroundColor ?? YHColor.primary,
          onTap: () {
            Navigator.pop(context, true);
            onConfirm();
          },
        )
      ],
    );
  }
}
