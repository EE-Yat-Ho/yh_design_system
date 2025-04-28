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
    this.padding = const EdgeInsets.all(0),
    this.text,
    this.image,
    this.leftWidget,
    this.rightWidget,
    this.spacing = 0,
    required this.onTap,
    this.backgroundColor,
    this.textColor = YHColor.white,
    this.enable = true,
    this.borderColor,
    this.borderWidth = 0,
    this.cornerRadius = 8,
    this.horizontalAlignment = MainAxisAlignment.center,
    this.shadow = true,
    this.expands = false,
  });

  final bool autoResize;
  final double? width;
  final double? height;
  final EdgeInsets padding;

  final YHText? text;
  final Widget? image;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final double spacing;
  final void Function()? onTap;

  final YHColor? backgroundColor;
  final YHColor textColor;

  final bool enable;
  final bool shadow;

  final YHColor? borderColor;
  final double borderWidth;
  final double cornerRadius;

  final MainAxisAlignment horizontalAlignment;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return expands ? Expanded(child: _build()) : _build();
  }

  Widget _build() {
    var children = <Widget>[];

    if (leftWidget != null) {
      children.add(leftWidget!);
    }
    if (text != null) {
      children.add(text!);
    }
    if (image != null) {
      children.add(image!);
    }
    if (rightWidget != null) {
      children.add(rightWidget!);
    }
    final backgroundColor = this.backgroundColor ?? YHColor.primary;
    final borderColor = this.borderColor ?? YHColor.primary;

    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: shadow ? 2 : 0,
      focusElevation: shadow ? 2 : 0,
      highlightElevation: 1,
      hoverElevation: 0,
      disabledElevation: 1,
      fillColor: enable ? backgroundColor.color : YHColor.actionDisabled.color,
      constraints: BoxConstraints(minHeight: height ?? 0, minWidth: width ?? 0),
      onPressed: enable ? onTap : null,
      shape: RoundedRectangleBorder(
        side: borderWidth > 0
            ? BorderSide(color: borderColor.color, width: borderWidth)
            : BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          spacing: spacing,
          mainAxisSize: autoResize ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: horizontalAlignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
