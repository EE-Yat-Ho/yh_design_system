import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHTextFieldDialog extends StatelessWidget {
  YHTextFieldDialog({
    super.key,
    required this.onPressed,
    required this.title,
    required this.hintText,
    this.image,
  });

  final String title;
  final String hintText;
  final YHImage? image;
  final TextEditingController textController = TextEditingController(text: "");
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    var icon = image == null
        ? null
        : SizedBox.fromSize(
            size: const Size.fromRadius(50), child: image?.icon());

    return AlertDialog(
      icon: icon,
      backgroundColor: YHColor.white.color,
      title: YHText(
        text: title,
        font: YHFont.h4,
        color: YHColor.black,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(hintText: hintText),
              autofocus: true,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("취소"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: YHColor.primary.color,
            foregroundColor: YHColor.white.color,
          ),
          onPressed: () {
            onPressed(textController.text);
            Navigator.pop(context);
          },
          child:
              const YHText(text: "확인", font: YHFont.h6, color: YHColor.white),
        )
      ],
    );
  }
}
