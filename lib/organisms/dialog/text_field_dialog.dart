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
    this.confirmText = "확인",
    this.cancelText = "취소",
    this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.onConfirm,
  }) {
    textController = YHTextEditingController(text: initialValue);
  }

  final String? title;
  final Widget? titleWidget;
  final String? hintText;
  final String confirmText;
  final String cancelText;
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
      backgroundColor: YHColor.white.color,
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
                hintStyle: TextStyle(color: YHColor.placeholder.color),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: YHColor.gray400.color),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: YHColor.primary.color),
                ),
              ),
              style: TextStyle(color: YHColor.black.color),
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
            text: widget.cancelText,
            font: YHFont.regular16,
            color: YHColor.contentSecondary,
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm(widget.textController.text);
            Navigator.of(context).pop();
          },
          child: YHText(
            text: widget.confirmText,
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
