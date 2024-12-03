import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/components/text/text.dart';
import 'package:yh_design_system/fonts.dart';
import 'package:yh_design_system/images.dart';

class YHImageTextButton extends StatefulWidget {
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
  State<YHImageTextButton> createState() => _YHImageTextButtonState();
}

class _YHImageTextButtonState extends State<YHImageTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.all(5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child());
  }

  Widget child() {
    List<Widget> list = [];

    if (widget.image != null) {
      list.add(widget.image!.icon(width: 18, height: 18));
    } else if (widget.iconData != null) {
      list.add(Icon(widget.iconData));
    }
    list.add(YHText(
        text: widget.text,
        font: YHFont.regular16,
        color: widget.textColor ?? YHColor.primary));

    return Row(children: list);
  }
}
