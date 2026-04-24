import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_util/common/theme.dart';

final class YHAppBar extends StatelessWidget implements PreferredSizeWidget {
  // macOS 창 좌상단 traffic light 버튼(닫기/최소화/최대화) 영역 회피 폭.
  static const double _macTrafficLightPadding = 78;
  static bool get _isMacOsDesktop =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;

  final String? title;
  final YHFont titleFont;
  // title(String) 대신 쓸 수 있는 Widget 제목. 지정 시 title/titleFont/titleOnTap은 무시된다.
  final Widget? titleWidget;
  // 왼쪽 버튼
  final Widget? left;
  final double leftPadding;
  final double? leftWidth;
  final bool showLeftDrawerButton;
  final void Function()? drawerButtonOnTap;
  // 오른쪽 버튼
  final Widget? right;
  final double? rightPadding;
  final double? height;
  // null이면 Material 테마 기본(보통 surface)을 따른다.
  final Color? backgroundColor;
  final Color? foregroundColor;
  // 백버튼, 닫기버튼
  final bool showBack;
  final bool showClose;
  // true면 YHImage 에셋 대신 Material의 BackButton/CloseButton을 사용한다.
  final bool useMaterialIcons;
  final Color? iconColor;
  // 라이트/다크 모드에 따라 시스템 오버레이 스타일 설정(상태바 색상)
  final SystemUiOverlayStyle? systemOverlayStyle;
  final void Function()? backButtonOnTap;
  final void Function()? titleOnTap;

  const YHAppBar({
    super.key,
    this.title,
    this.titleFont = YHFont.regular16,
    this.titleWidget,
    this.showBack = true,
    this.showClose = false,
    this.useMaterialIcons = false,
    this.iconColor,
    this.left,
    this.leftPadding = 8,
    this.leftWidth,
    this.showLeftDrawerButton = false,
    this.drawerButtonOnTap,
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
      systemOverlayStyle: YHTheme.systemOverlayStyle);

  @override
  Widget build(BuildContext context) {
    Widget? resolvedTitle = titleWidget;
    if (resolvedTitle == null && title != null && title!.isNotEmpty) {
      if (titleOnTap != null) {
        resolvedTitle = YHInkWell(
          onTap: titleOnTap!,
          child: YHText(
            text: title!,
            font: titleFont,
            color: foregroundColor ?? YHColor.textDefault,
          ),
        );
      } else {
        resolvedTitle = YHText(
          text: title!,
          font: titleFont,
          color: foregroundColor ?? YHColor.textDefault,
        );
      }
    }

    final macPadding = _isMacOsDesktop ? _macTrafficLightPadding : 0.0;
    final effectiveLeftPadding = leftPadding + macPadding;

    // Material AppBar처럼 pop 불가한 컨텍스트에선 back 버튼을 그리지 않는다.
    final showBackResolved = showBack && Navigator.canPop(context);

    return AppBar(
      actions: [
        if (showClose) _closeButton(context),
        if (right != null) right!,
        if (rightPadding != null) SizedBox(width: rightPadding!),
      ],
      systemOverlayStyle: systemOverlayStyle ?? YHTheme.systemOverlayStyle,
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      leading: Row(children: [
        SizedBox(width: effectiveLeftPadding),
        if (showLeftDrawerButton) _drawerButton(context),
        if (showBackResolved) _backButton(context),
        if (left != null) left!,
      ]),
      leadingWidth: leftWidth ??
          (resolvedTitle == null
              ? double.infinity
              : (macPadding > 0 ? 56.0 + macPadding : null)),
      title: resolvedTitle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      centerTitle: true,
    );
  }

  Widget _drawerButton(BuildContext context) {
    return YHButton(
      onTap: drawerButtonOnTap != null
          ? drawerButtonOnTap!
          : () => Scaffold.of(context).openDrawer(),
      image: YHImage.icon_hamburger_72
          .icon(color: iconColor ?? YHColor.iconDefault),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      useShadow: false,
    );
  }

  Widget _backButton(BuildContext context) {
    if (useMaterialIcons) {
      return BackButton(
        color: iconColor ?? foregroundColor,
        onPressed: backButtonOnTap,
      );
    }
    return YHButton(
      onTap: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image: YHImage.icon_back_24.icon(color: iconColor ?? YHColor.iconDefault),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      useShadow: false,
    );
  }

  Widget _closeButton(BuildContext context) {
    if (useMaterialIcons) {
      return CloseButton(
        color: iconColor ?? foregroundColor,
        onPressed: backButtonOnTap,
      );
    }
    return YHButton(
      onTap: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image:
          YHImage.icon_close_24.icon(color: iconColor ?? YHColor.iconDefault),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      useShadow: false,
    );
  }
}
