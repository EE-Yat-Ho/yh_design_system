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
    this.padding,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final String? title;
  final IconData? iconData;
  final YHImage? image;
  final EdgeInsets? padding;
  @override
  State<YHSolidButton> createState() => _YHSolidButtonState();
}

class _YHSolidButtonState extends State<YHSolidButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.padding != null) {
      return Padding(
        padding: widget.padding!,
        child: _button(),
      );
    }
    return _button();
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: YHColor.primary.color,
        padding: const EdgeInsets.fromLTRB(14, 7, 14, 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _children(),
      ),
    );
  }

  List<Widget> _children() {
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
        font: YHFont.bold18,
        color: YHColor.white,
      ));
    }
    return list;
  }
}
