import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/atoms/button/small_solid_button.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/fonts.dart';
import 'package:yh_design_system/images.dart';

class TitleImageDialog extends StatelessWidget {
  const TitleImageDialog({
    super.key,
    required this.title,
    this.image,
    this.confirmText,
    required this.onConfirm,
    this.cancelText,
    this.onCancel,
  });

  final String title;
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

    return AlertDialog(
        icon: icon,
        backgroundColor: YHColor.white.color,
        title: YHText(
          text: title,
          font: YHFont.regular16,
          color: YHColor.black,
          align: TextAlign.center,
          maxLines: 3,
        ),
        actions: actions);
  }
}
