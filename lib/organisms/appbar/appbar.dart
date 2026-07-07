import 'dart:math' as math;

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

  // iPad 스테이지 매니저 창모드일 때 좌상단 창 컨트롤(신호등) 영역 회피 폭.
  // macOS보다 컨트롤이 작아 폭을 줄인다.
  static const double _iPadStageManagerPadding = 56;

  // iPad 스테이지 매니저 창모드 감지(근사).
  // 스테이지 매니저 전용 API가 없어, iOS에서 앱 창이 디스플레이 전체를
  // 채우지 않으면(= 전체화면이 아니면) 창모드로 간주한다.
  // Split View/Slide Over도 걸릴 수 있으나, 그 경우 여분 여백이 생길 뿐 겹침은 없다.
  //
  // 주의: Display.size는 디바이스 물리 해상도 고정값이라 회전해도 값이 바뀌지
  // 않는다. 반면 MediaQuery.sizeOf(창 크기)는 회전을 반영한다. 그래서 폭끼리
  // 직접 비교하면 가로 모드에서 오판한다. 방향 무관하게 긴 변/짧은 변끼리 비교한다.
  static bool _isIPadStageManager(BuildContext context) {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) return false;
    final view = View.of(context);
    // Display.size는 물리 픽셀 → 논리 픽셀로 환산.
    final dpr = view.devicePixelRatio;
    final displayW = view.display.size.width / dpr;
    final displayH = view.display.size.height / dpr;
    final displayLong = math.max(displayW, displayH);
    final displayShort = math.min(displayW, displayH);

    final window = MediaQuery.sizeOf(context);
    final windowLong = math.max(window.width, window.height);
    final windowShort = math.min(window.width, window.height);

    return windowLong < displayLong - 1.0 || windowShort < displayShort - 1.0;
  }

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

    // 좌상단 창 컨트롤(traffic light) 회피 폭. macOS 데스크탑 우선,
    // 아니면 iPad 스테이지 매니저 창모드 여부로 결정.
    final double windowControlPadding = _isMacOsDesktop
        ? _macTrafficLightPadding
        : (_isIPadStageManager(context) ? _iPadStageManagerPadding : 0.0);
    final effectiveLeftPadding = leftPadding + windowControlPadding;

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
              : (windowControlPadding > 0 ? 56.0 + windowControlPadding : null)),
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
