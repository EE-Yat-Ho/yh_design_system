import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text_field/text_editing_controller.dart';

final class YHTextFieldDialog extends StatefulWidget {
  YHTextFieldDialog({
    super.key,
    this.title,
    this.titleWidget,
    this.icon,
    String? initialValue,
    this.hintText,
    this.confirmText,
    this.cancelText,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.onConfirm,
  }) {
    textController = YHTextEditingController(text: initialValue);
  }

  final String? title;
  final Widget? titleWidget;
  final String? hintText;
  final String? confirmText;
  final String? cancelText;
  final Widget? icon;
  final int? maxLength;
  final TextInputType keyboardType;
  late final YHTextEditingController textController;
  final void Function(String?) onConfirm;

  @override
  State<YHTextFieldDialog> createState() => _YHTextFieldDialogState();
}

class _YHTextFieldDialogState extends State<YHTextFieldDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: widget.icon,
      backgroundColor: YHColor.white,
      title: widget.title != null
          ? YHText(
              text: widget.title!,
              font: YHFont.regular18,
              color: YHColor.black,
            )
          : widget.titleWidget,
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: widget.textController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: YHColor.textPlaceholder),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: YHColor.surfaceSub),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: YHColor.primary),
                ),
              ),
              style: const TextStyle(color: YHColor.textDefault),
              maxLength: widget.maxLength,
              keyboardType: widget.keyboardType,
              autofocus: true,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: YHText(
            text: widget.cancelText ?? 'common.cancel'.tr(),
            font: YHFont.regular16,
            color: YHColor.textSub,
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(widget.textController.text);
            Navigator.of(context).pop();
          },
          child: YHText(
            text: widget.confirmText ?? 'common.confirm'.tr(),
            font: YHFont.regular16,
            color: YHColor.primary,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }
}
