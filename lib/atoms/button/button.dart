// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';

class YHButton extends StatelessWidget {
  const YHButton({
    super.key,
    // autoResize가 true면 최대 영역을 잡음. false면 최대한 작아지고 지정해준 크기로됨
    this.autoResize = true,
    this.width,
    this.height,
    this.text,
    this.leftIcon,
    this.rightIcon,
    required this.onPressed,
    this.backgroundColor = YHColor.primary,
    this.textColor = YHColor.white,
    this.disable = false,
    this.borderColor = YHColor.primary,
    this.borderWidth = 0,
    this.cornerRadius = 8,
    this.horizontalAlignment = MainAxisAlignment.center,
  });

  final bool autoResize;
  final double? width;
  final double? height;

  final YHText? text;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final GestureTapCallback onPressed;

  final YHColor backgroundColor;
  final YHColor textColor;

  final bool disable;

  final YHColor borderColor;
  final double borderWidth;
  final double cornerRadius;

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
      highlightElevation: 1,
      hoverElevation: 0,
      disabledElevation: 1,
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
