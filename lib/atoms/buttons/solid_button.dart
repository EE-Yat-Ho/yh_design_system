import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHSolidButton extends StatefulWidget {
  const YHSolidButton({
    super.key,
    this.title,
    this.iconData,
    this.image,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String? title;
  final IconData? iconData;
  final YHImage? image;

  @override
  State<YHSolidButton> createState() => _YHSolidButtonState();
}

class _YHSolidButtonState extends State<YHSolidButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: YHColor.primary.color,
        padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children(),
      ),
    );
  }

  List<Widget> children() {
    List<Widget> list = [];
    if (widget.iconData != null) {
      list.add(Icon(widget.iconData));
    }
    if (widget.image != null) {
      list.add(widget.image!.icon());
    }
    if (widget.title != null) {
      list.add(YHText(
        text: widget.title ?? "",
        font: YHFont.h3,
        color: YHColor.white,
      ));
    }
    return list;
  }
}
