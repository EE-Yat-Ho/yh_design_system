import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/text_field/text_editing_controller.dart';

class YHTextFieldDialog extends StatefulWidget {
  YHTextFieldDialog({
    super.key,
    required this.title,
    String? initialValue,
    this.hintText,
    this.confirmText = "확인",
    this.cancelText = "취소",
    this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.onConfirm,
    this.image,
  }) {
    textController = YHTextEditingController(text: initialValue);
  }

  final String title;
  final String? hintText;
  final String confirmText;
  final String cancelText;
  final int? maxLength;
  final TextInputType keyboardType;
  final YHImage? image;
  late final YHTextEditingController textController;
  final void Function(String?) onConfirm;

  @override
  State<YHTextFieldDialog> createState() => _YHTextFieldDialogState();
}

class _YHTextFieldDialogState extends State<YHTextFieldDialog> {
  @override
  Widget build(BuildContext context) {
    var icon = widget.image == null
        ? null
        : SizedBox.fromSize(
            size: const Size.fromRadius(50), child: widget.image?.icon());

    return AlertDialog(
      icon: icon,
      backgroundColor: YHColor.white.color,
      title: YHText(
        text: widget.title,
        font: YHFont.regular18,
        color: YHColor.black,
      ),
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
