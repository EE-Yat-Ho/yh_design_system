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
    this.isEnabled = true,
    this.disableColor = YHColor.actionDisabled,
    this.font = YHFont.bold18,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final String? title;
  final IconData? iconData;
  final YHImageInterface? image;
  final EdgeInsets? padding;
  final bool isEnabled;
  final YHColor disableColor;
  final YHFont font;
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
      onPressed: widget.isEnabled ? widget.onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isEnabled
            ? YHColor.primary.color
            : widget.disableColor.color,
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
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
        font: widget.font,
        color: YHColor.white,
      ));
    }
    return list;
  }
}
