import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

enum YHSmallSolidButtonType {
  primary(YHColor.primary, YHColor.white),
  white(YHColor.white, YHColor.black);

  const YHSmallSolidButtonType(this.bgColor, this.textColor);
  final YHColor bgColor;
  final YHColor textColor;
}

class YHSmallSolidButton extends StatefulWidget {
  const YHSmallSolidButton({
    super.key,
    this.title,
    this.iconData,
    this.image,
    this.type = YHSmallSolidButtonType.primary,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String? title;
  final IconData? iconData;
  final YHImage? image;
  final YHSmallSolidButtonType type;

  @override
  State<YHSmallSolidButton> createState() => _YHSmallSolidButtonState();
}

class _YHSmallSolidButtonState extends State<YHSmallSolidButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.type.bgColor.color,
        padding: const EdgeInsets.fromLTRB(14, 7, 14, 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
          font: YHFont.regular14,
          color: widget.type.textColor));
    }
    return list;
  }
}
