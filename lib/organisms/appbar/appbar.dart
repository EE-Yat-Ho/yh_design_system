import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

final class YHAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final YHFont titleFont;
  final bool showBack;
  final bool showClose;
  final Widget? left;
  final double leftPadding;
  final double? leftWidth;
  final Widget? right;
  final double? rightPadding;
  final double? height;
  final YHColor backgroundColor;
  final YHColor foregroundColor;
  final void Function()? backButtonOnTap;
  final void Function()? titleOnTap;

  const YHAppBar({
    super.key,
    this.title,
    this.titleFont = YHFont.regular16,
    this.showBack = true,
    this.showClose = false,
    this.left,
    this.leftPadding = 8,
    this.leftWidth,
    this.right,
    this.rightPadding,
    this.height = kToolbarHeight,
    this.backgroundColor = YHColor.transparent,
    this.foregroundColor = YHColor.contentPrimary,
    this.backButtonOnTap,
    this.titleOnTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;
    if (title != null && title!.isNotEmpty) {
      if (titleOnTap != null) {
        titleWidget = YHInkWell(
          onTap: titleOnTap!,
          child: YHText(
            text: title!,
            font: titleFont,
            color: foregroundColor,
          ),
        );
      } else {
        titleWidget = YHText(
          text: title!,
          font: titleFont,
          color: foregroundColor,
        );
      }
    }

    return AppBar(
      actions: [
        if (showClose) _closeButton(context),
        if (right != null) right!,
        if (rightPadding != null) SizedBox(width: rightPadding!),
      ],
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      leading: Row(children: [
        SizedBox(width: leftPadding),
        if (showBack) _backButton(context),
        if (left != null) left!,
      ]),
      leadingWidth: leftWidth ?? (titleWidget == null ? double.infinity : null),
      title: titleWidget,
      backgroundColor: backgroundColor.color,
      foregroundColor: foregroundColor.color,
      centerTitle: true,
    );
  }

  Widget _backButton(BuildContext context) {
    return YHButton(
      onTap: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image: Image.asset("assets/images/icon_back_line_24.png",
          width: 24,
          height: 24,
          fit: BoxFit.fitHeight,
          package: "yh_design_system"),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      shadow: false,
    );
  }

  Widget _closeButton(BuildContext context) {
    return YHButton(
      onTap: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image: YHImage.icon_close_line_24.icon(
        color: YHColor.contentTertiary,
        fit: BoxFit.fitHeight,
        package: "yh_design_system",
      ),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      shadow: false,
    );
  }
}
