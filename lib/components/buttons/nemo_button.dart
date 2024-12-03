// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/components/text/text.dart';

class YHButton extends StatelessWidget {
  YHButton({
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

    // If a left icon is provided, add it to the button
    // if (leftIcon != null) {
    //   children.add(Padding(
    //     padding: EdgeInsets.only(
    //       right: removePaddings
    //           ? 0
    //           : text != null
    //               ? (size == YHButtonSize.LARGE
    //                   ? 18
    //                   : size == YHButtonSize.MEDIUM
    //                       ? 14
    //                       : 9)
    //               : rightIcon != null
    //                   ? (size == YHButtonSize.SMALL ? 5 : 10)
    //                   : 0,
    //     ),
    //     child: leftIcon!,
    //   ));
    // }

    // If text is provided, add it to the button
    if (text != null) {
      children.add(text!);
    }

    // If a right icon is provided, add it to the button
    // if (rightIcon != null) {
    //   children.add(Padding(
    //     padding: EdgeInsets.only(
    //       left: removePaddings
    //           ? 0
    //           : text != null
    //               ? (size == YHButtonSize.LARGE
    //                   ? 18
    //                   : size == YHButtonSize.MEDIUM
    //                       ? 14
    //                       : 9)
    //               : leftIcon != null
    //                   ? (size == YHButtonSize.SMALL ? 5 : 10)
    //                   : 0,
    //     ),
    //     child: rightIcon!,
    //   ));
    // }

    // Return the final button
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
        padding: EdgeInsets.all(0),
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
