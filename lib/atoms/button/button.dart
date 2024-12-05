// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/components/text/text.dart';

class YHButton extends StatelessWidget {
  const YHButton({
    super.key,
    this.text,
    this.leftIcon,
    this.rightIcon,
    required this.onPressed,
    this.backgroundColor = YHColor.primary,
    this.textColor = YHColor.white,
    this.disable = false,
    this.width,
    this.height,
    this.borderColor = YHColor.primary,
    this.borderWidth = 0,
    this.cornerRadius = 8,
    this.autoResize = true,
    this.horizontalAlignment = MainAxisAlignment.center,
  });

  final YHText? text;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final GestureTapCallback onPressed;

  final YHColor backgroundColor;
  final YHColor textColor;

  final bool disable;

  final double? width;
  final double? height;

  final YHColor borderColor;
  final double borderWidth;
  final double cornerRadius;

  final bool autoResize;
  final MainAxisAlignment horizontalAlignment;

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    if (text != null) {
      children.add(text!);
    }

    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 2,
      focusElevation: 2,
      highlightElevation: 0,
      hoverElevation: 0,
      fillColor: disable ? YHColor.disable.color : backgroundColor.color,
      constraints: BoxConstraints(minHeight: height ?? 0, minWidth: width ?? 0),
      onPressed: disable ? null : onPressed,
      shape: RoundedRectangleBorder(
        side: borderWidth > 0
            ? BorderSide(color: borderColor.color, width: borderWidth)
            : BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: autoResize ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: horizontalAlignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
