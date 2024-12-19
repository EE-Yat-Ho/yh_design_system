import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/button/small_solid_button.dart';

class YHDialog extends StatelessWidget {
  const YHDialog({
    super.key,
    required this.title,
    this.subTitle,
    this.image,
    this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  final String title;
  final String? subTitle;
  final YHImage? image;

  final String? confirmText;
  final void Function() onConfirm;
  final String? cancelText;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    var icon = image == null
        ? null
        : SizedBox.fromSize(
            size: const Size.fromRadius(50), child: image?.icon());

    var actions = [
      YHSmallSolidButton(
        onPressed: () {
          Navigator.pop(context);
          onConfirm();
        },
        title: confirmText ?? "확인",
      ),
    ];

    if (cancelText != null) {
      actions.add(YHSmallSolidButton(
        type: YHSmallSolidButtonType.white,
        onPressed: () {
          if (onCancel != null) {
            onCancel!();
          }
          Navigator.pop(context);
        },
        title: cancelText!,
      ));
    }

    Widget? content;
    if (subTitle != null) {
      content = YHText(
        text: subTitle!,
        font: YHFont.regular14,
        color: YHColor.gray,
        align: TextAlign.center,
        maxLines: 10,
      );
    }

    return AlertDialog(
        icon: icon,
        backgroundColor: YHColor.white.color,
        title: YHText(
          text: title,
          font: YHFont.regular16,
          color: YHColor.black,
          align: TextAlign.center,
          maxLines: 10,
        ),
        content: content,
        actions: actions);
  }
}
