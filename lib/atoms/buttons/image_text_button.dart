import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHImageTextButton extends StatelessWidget {
  const YHImageTextButton({
    super.key,
    required this.text,
    this.iconData,
    this.image,
    this.textColor,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;
  final IconData? iconData;
  final YHImage? image;
  final YHColor? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.all(5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child());
  }

  Widget child() {
    List<Widget> list = [];

    if (image != null) {
      list.add(image!.icon(width: 18, height: 18));
    } else if (iconData != null) {
      list.add(Icon(iconData));
    }
    list.add(YHText(
        text: text,
        font: YHFont.regular16,
        color: textColor ?? YHColor.primary));

    return Row(children: list);
  }
}
