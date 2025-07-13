// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/decoration/yh_red_dot.dart';
import 'package:yh_design_system/atoms/row/row.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHButton extends StatelessWidget {
  const YHButton({
    super.key,
    // autoResize가 true면 최대 영역을 잡음. false면 최대한 작아지고 지정해준 크기로됨
    this.autoResize = true,
    this.width,
    this.height,
    this.padding,
    this.margin,
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
    this.useShadow = true,
    this.expands = false,
    this.redDot = false,
    this.redDotSize = 6,
    this.redDotInset = 4,
  });

  final bool autoResize;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  final YHText? text;
  final Widget? image;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final double spacing;
  final void Function()? onTap;

  final YHColor? backgroundColor;
  final YHColor textColor;

  final bool enable;
  final bool useShadow;
  final bool redDot;
  final double redDotInset;
  final double redDotSize;
  final YHColor? borderColor;
  final double borderWidth;
  final double cornerRadius;

  final MainAxisAlignment horizontalAlignment;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return expands ? Expanded(child: _body()) : _body();
  }

  YHColor get _backgroundColor => backgroundColor ?? YHColor.primary;
  YHColor get _borderColor => borderColor ?? YHColor.primary;

  Widget _body() {
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

    Widget row = YHRow(
      spacing: spacing,
      padding: padding,
      mainAxisSize: autoResize ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: horizontalAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );

    Widget button = RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: useShadow ? 2 : 0,
      focusElevation: useShadow ? 2 : 0,
      highlightElevation: useShadow ? 1 : 0,
      hoverElevation: 0,
      disabledElevation: 1,
      fillColor: enable ? _backgroundColor.color : YHColor.actionDisabled.color,
      constraints: BoxConstraints(minHeight: height ?? 0, minWidth: width ?? 0),
      onPressed: enable ? onTap : null,
      shape: RoundedRectangleBorder(
        side: borderWidth > 0
            ? BorderSide(color: _borderColor.color, width: borderWidth)
            : BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
      ),
      child: row,
    );

    if (redDot) {
      button = Stack(
        children: [
          button,
          Positioned(
            top: redDotInset,
            right: redDotInset,
            child: Container(
              width: redDotSize,
              height: redDotSize,
              decoration: redDotDecoration,
            ),
          ),
        ],
      );
    }

    if (margin != null) {
      button = Padding(
        padding: margin!,
        child: button,
      );
    }

    return button;
  }
}
