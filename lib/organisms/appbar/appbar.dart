import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/utils/theme.dart';

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
  final Color backgroundColor;
  final Color? foregroundColor;
  // 라이트/다크 모드에 따라 시스템 오버레이 스타일 설정(상태바 색상)
  final SystemUiOverlayStyle? systemOverlayStyle;
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
    this.foregroundColor,
    this.systemOverlayStyle,
    this.backButtonOnTap,
    this.titleOnTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  // 기본 앱바 설정
  static YHAppBar get defaultAppBar => YHAppBar(
        showBack: false,
        height: 0,
        systemOverlayStyle: YHTheme.isDarkMode
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      );

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
            color: foregroundColor ?? YHColor.textDefault,
          ),
        );
      } else {
        titleWidget = YHText(
          text: title!,
          font: titleFont,
          color: foregroundColor ?? YHColor.textDefault,
        );
      }
    }

    return AppBar(
      actions: [
        if (showClose) _closeButton(context),
        if (right != null) right!,
        if (rightPadding != null) SizedBox(width: rightPadding!),
      ],
      systemOverlayStyle: systemOverlayStyle,
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      leading: Row(children: [
        SizedBox(width: leftPadding),
        if (showBack) _backButton(context),
        if (left != null) left!,
      ]),
      leadingWidth: leftWidth ?? (titleWidget == null ? double.infinity : null),
      title: titleWidget,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      centerTitle: true,
    );
  }

  Widget _backButton(BuildContext context) {
    return YHButton(
      onTap: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image: YHImage.icon_back_24.icon(color: YHColor.iconDefault),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      useShadow: false,
    );
  }

  Widget _closeButton(BuildContext context) {
    return YHButton(
      onTap: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image: YHImage.icon_close_24.icon(color: YHColor.iconDefault),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      useShadow: false,
    );
  }
}
