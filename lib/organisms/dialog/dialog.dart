import 'dart:async';

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

final class YHDialog extends StatefulWidget {
  const YHDialog({
    super.key,
    this.titleFont = YHFont.regular16,
    this.titleColor,
    this.subTextFont = YHFont.regular14,
    this.subTextColor,
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
    this.enableConfirmDelay = false,
    this.delaySeconds = 5,
  });

  final String text;
  final String? subText;
  final YHFont titleFont;
  final Color? titleColor;
  final YHFont subTextFont;
  final Color? subTextColor;
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
  final bool enableConfirmDelay;
  final int delaySeconds;

  final String? confirmText;
  final void Function() onConfirm;

  final String? cancelText;
  final void Function()? onCancel;

  @override
  State<YHDialog> createState() => _YHDialogState();
}

class _YHDialogState extends State<YHDialog> {
  Timer? _timer;
  int _remainingSeconds = 0;
  bool _isConfirmEnabled = true;

  @override
  void initState() {
    super.initState();
    if (widget.enableConfirmDelay) {
      _remainingSeconds = widget.delaySeconds;
      _isConfirmEnabled = false;
      _startCountdown();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _remainingSeconds--;
          if (_remainingSeconds <= 0) {
            _isConfirmEnabled = true;
            timer.cancel();
          }
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = widget.image == null ? 20 : 16;

    return Dialog(
      backgroundColor: YHColor.surfaceDefault,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400, // 패드나 노트에서 너무 넓어지지 않게
        ),
        child: YHColumn(
          padding: EdgeInsets.fromLTRB(20, topPadding, 20, 20),
          crossAxisAlignment: widget.columnCrossAxisAlignment,
          mainAxisAlignment: widget.columnMainAxisAlignment,
          mainAxisSize: widget.columnMainAxisSize,
          children: [
            if (widget.image != null) ...[
              widget.image!.icon(
                width: widget.imageWidth ?? double.infinity,
                height: widget.imageHeight ?? 100,
              ),
              SizedBox(height: widget.imageBottomPadding ?? 16),
            ],
            _title(),
            if (widget.subText != null) ...[
              const SizedBox(height: 8),
              _subText(),
            ],
            SizedBox(height: widget.buttonTopPadding ?? 24),
            if (widget.buttonDirection == ButtonDirection.horizontal)
              _rowButtons(context)
            else
              _columnButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return YHText(
        text: widget.text,
        font: widget.titleFont,
        color: widget.titleColor ?? YHColor.textDefault,
        maxLines: 15,
        align: widget.titleAlign);
  }

  Widget _subText() {
    return YHText(
        text: widget.subText!,
        font: widget.subTextFont,
        color: widget.subTextColor ?? YHColor.textSub,
        maxLines: 15,
        align: widget.subTextAlign);
  }

  String _getConfirmButtonText() {
    final baseText = widget.confirmText ?? 'common.confirm'.tr();
    if (widget.enableConfirmDelay && !_isConfirmEnabled) {
      return '$baseText ($_remainingSeconds)';
    }
    return baseText;
  }

  Widget _rowButtons(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        if (widget.cancelText != null)
          YHButton(
            cornerRadius: widget.buttonCornerRadius ?? 8,
            borderColor: YHColor.surfaceSub,
            borderWidth: 1,
            expands: true,
            text: YHText(
                text: widget.cancelText!,
                font: widget.buttonFont,
                color: YHColor.textDefault),
            height: 48,
            backgroundColor: YHColor.surfaceDefault,
            onTap: () {
              Navigator.pop(context, false);
              if (widget.onCancel != null) {
                widget.onCancel!();
              }
            },
          ),
        YHButton(
          cornerRadius: widget.buttonCornerRadius ?? 8,
          expands: true,
          text: YHText(
              text: _getConfirmButtonText(),
              font: widget.buttonFont,
              color: YHColor.textWhite),
          height: 48,
          backgroundColor:
              widget.confirmButtonBackgroundColor ?? YHColor.primary,
          enable: _isConfirmEnabled,
          onTap: () {
            Navigator.pop(context, true);
            widget.onConfirm();
          },
        )
      ],
    );
  }

  Widget _columnButtons(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        if (widget.cancelText != null)
          YHButton(
            cornerRadius: widget.buttonCornerRadius ?? 24,
            borderColor: YHColor.surfaceSub,
            borderWidth: 1,
            text: YHText(
                text: widget.cancelText!,
                font: widget.buttonFont,
                color: YHColor.textDefault),
            height: 48,
            width: double.infinity,
            backgroundColor: YHColor.surfaceDefault,
            onTap: () {
              Navigator.pop(context, false);
              if (widget.onCancel != null) {
                widget.onCancel!();
              }
            },
          ),
        YHButton(
          cornerRadius: widget.buttonCornerRadius ?? 24,
          text: YHText(
              text: _getConfirmButtonText(),
              font: widget.buttonFont,
              color: YHColor.textWhite),
          height: 48,
          width: double.infinity,
          backgroundColor:
              widget.confirmButtonBackgroundColor ?? YHColor.primary,
          enable: _isConfirmEnabled,
          onTap: () {
            Navigator.pop(context, true);
            widget.onConfirm();
          },
        )
      ],
    );
  }
}
