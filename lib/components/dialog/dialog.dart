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
    this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  final String text;
  final String? subText;
  final YHImage? image;

  final String? confirmText;
  final void Function() onConfirm;
  final String? cancelText;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    if (image != null) {
      icon = SizedBox.fromSize(
          size: const Size.fromRadius(50), child: image?.icon());
    }

    var actions = [
      YHButton(
        text: YHText(
            text: confirmText ?? "확인",
            font: YHFont.regular14,
            color: YHColor.white),
        height: 40,
        backgroundColor: YHColor.primary,
        onPressed: () {
          Navigator.pop(context);
          onConfirm();
        },
      ),
    ];

    if (cancelText != null) {
      actions.add(
        YHButton(
          text: YHText(
            text: cancelText!,
            font: YHFont.regular14,
            color: YHColor.black,
          ),
          backgroundColor: YHColor.white,
          onPressed: () {
            Navigator.pop(context);
            if (onCancel != null) {
              onCancel!();
            }
          },
        ),
      );
    }

    Widget title = YHText(
        text: text,
        font: YHFont.regular14,
        color: YHColor.black,
        align: TextAlign.start,
        maxLines: 10);

    Widget? content;
    if (subText != null) {
      content = YHText(
        text: subText!,
        font: YHFont.regular14,
        color: YHColor.gray,
        align: TextAlign.center,
        maxLines: 10,
      );
    }

    return AlertDialog(
      icon: icon,
      backgroundColor: YHColor.white.color,
      title: title,
      titlePadding: const EdgeInsets.all(24),
      content: content,
      actions: actions,
      actionsPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }
}
