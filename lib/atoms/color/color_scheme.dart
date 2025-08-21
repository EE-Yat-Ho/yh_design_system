// ignore_for_file: type=lint

import 'package:flutter/material.dart';

/// YH 디자인 시스템의 색상 스킴
/// 라이트 모드와 다크 모드에 대응하는 색상을 정의합니다.
final class YHColorScheme {
  // MARK: - 색 스킴 구성요소들
  const YHColorScheme._({
    required this.brightness,

    // Custom
    required this.note,
    required this.gold,
    required this.textActionSheet,

    // Semantic Colors - Text
    required this.textDefault,
    required this.textSub,
    required this.textDisabled,
    required this.textPlaceholder,
    required this.textWhite,
    required this.textPrimary,
    required this.textError,
    required this.textWarning,

    // Semantic Colors - Icon
    required this.iconDefault,
    required this.iconSub,
    required this.iconSubWeak,
    required this.iconDisabled,
    required this.iconWhite,
    required this.iconPrimary,
    required this.iconError,
    required this.iconWarning,

    // Semantic Colors - Stroke
    required this.strokeDefault,
    required this.strokeWeak,
    required this.strokeStrong,
    required this.strokeNeutral,
    required this.strokeBlack,
    required this.strokeBlackWeak,
    required this.strokeWhite,
    required this.strokePrimary,
    required this.strokeError,
    required this.strokeOverlay,
    required this.strokeTransparent,

    // Semantic Colors - Background
    required this.backgroundBasement,
    required this.backgroundDefault,
    required this.backgroundBasementBlack,
    required this.backgroundDefaultBlack,

    // Semantic Colors - Surface
    required this.surfaceDefault,
    required this.surfaceSubWeak,
    required this.surfaceSub,
    required this.surfaceSubStrong,
    required this.surfaceBlack,
    required this.surfaceBlackWeak,
    required this.surfaceNeutral,
    required this.surfaceDisabled,
    required this.surfaceDisabledStrong,
    required this.surfacePrimary,
    required this.surfacePrimaryWeak,
    required this.surfacePrimaryWeaker,
    required this.surfaceError,
    required this.surfaceErrorWeak,
    required this.surfaceOverlayStrong,
    required this.surfaceOverlay,
    required this.surfaceOverlayWeak,
    required this.surfaceOverlayWeaker,
  });

  final Brightness brightness;

  // Custom
  final Color note;
  final Color gold;
  final Color textActionSheet;

  // Semantic Colors - Text
  final Color textDefault;
  final Color textSub;
  final Color textDisabled;
  final Color textPlaceholder;
  final Color textWhite;
  final Color textPrimary;
  final Color textError;
  final Color textWarning;

  // Semantic Colors - Icon
  final Color iconDefault;
  final Color iconSub;
  final Color iconSubWeak;
  final Color iconDisabled;
  final Color iconWhite;
  final Color iconPrimary;
  final Color iconError;
  final Color iconWarning;

  // Semantic Colors - Stroke
  final Color strokeDefault;
  final Color strokeWeak;
  final Color strokeStrong;
  final Color strokeNeutral;
  final Color strokeBlack;
  final Color strokeBlackWeak;
  final Color strokeWhite;
  final Color strokePrimary;
  final Color strokeError;
  final Color strokeOverlay;
  final Color strokeTransparent;

  // Semantic Colors - Background
  final Color backgroundBasement;
  final Color backgroundDefault;
  final Color backgroundBasementBlack;
  final Color backgroundDefaultBlack;

  // Semantic Colors - Surface
  final Color surfaceDefault;
  final Color surfaceSubWeak;
  final Color surfaceSub;
  final Color surfaceSubStrong;
  final Color surfaceBlack;
  final Color surfaceBlackWeak;
  final Color surfaceNeutral;
  final Color surfaceDisabled;
  final Color surfaceDisabledStrong;
  final Color surfacePrimary;
  final Color surfacePrimaryWeak;
  final Color surfacePrimaryWeaker;
  final Color surfaceError;
  final Color surfaceErrorWeak;
  final Color surfaceOverlayStrong;
  final Color surfaceOverlay;
  final Color surfaceOverlayWeak;
  final Color surfaceOverlayWeaker;

  // MARK: - 밝은 색 스킴
  static const YHColorScheme light = YHColorScheme._(
    brightness: Brightness.light,

    // Custom
    note: Color(0xFFF59E0B),
    gold: Color(0xFFFFBB01),
    textActionSheet: Color(0xFF485F85),

    // Semantic Colors - Text
    textDefault: _YHBaseColors.gray900,
    textSub: _YHBaseColors.gray500,
    textDisabled: _YHBaseColors.gray300,
    textPlaceholder: _YHBaseColors.gray400,
    textWhite: _YHBaseColors.white,
    textPrimary: _YHBaseColors.primary,
    textError: _YHBaseColors.red500,
    textWarning: _YHBaseColors.orange500,

    // Semantic Colors - Icon
    iconDefault: _YHBaseColors.gray900,
    iconSub: _YHBaseColors.gray500,
    iconSubWeak: _YHBaseColors.gray300,
    iconDisabled: _YHBaseColors.gray300,
    iconWhite: _YHBaseColors.white,
    iconPrimary: _YHBaseColors.primary,
    iconError: _YHBaseColors.red500,
    iconWarning: _YHBaseColors.orange500,

    // Semantic Colors - Stroke
    strokeDefault: _YHBaseColors.gray200,
    strokeWeak: _YHBaseColors.gray100,
    strokeStrong: _YHBaseColors.gray300,
    strokeNeutral: _YHBaseColors.gray500,
    strokeBlack: _YHBaseColors.gray900,
    strokeBlackWeak: _YHBaseColors.gray700,
    strokeWhite: _YHBaseColors.white,
    strokePrimary: _YHBaseColors.primary,
    strokeError: _YHBaseColors.red500,
    strokeOverlay: _YHBaseColors.gray100,
    strokeTransparent: _YHBaseColors.transparent,

    // Semantic Colors - Background
    backgroundBasement: _YHBaseColors.gray100,
    backgroundDefault: _YHBaseColors.white,
    backgroundBasementBlack: _YHBaseColors.gray950,
    backgroundDefaultBlack: _YHBaseColors.gray800,

    // Semantic Colors - Surface
    surfaceDefault: _YHBaseColors.white,
    surfaceSubWeak: _YHBaseColors.gray50,
    surfaceSub: _YHBaseColors.gray100,
    surfaceSubStrong: _YHBaseColors.gray200,
    surfaceBlack: _YHBaseColors.gray900,
    surfaceBlackWeak: _YHBaseColors.gray700,
    surfaceNeutral: _YHBaseColors.gray500,
    surfaceDisabled: _YHBaseColors.gray100,
    surfaceDisabledStrong: _YHBaseColors.gray300,
    surfacePrimary: _YHBaseColors.primary,
    surfacePrimaryWeak: _YHBaseColors.blue100,
    surfacePrimaryWeaker: _YHBaseColors.blue50,
    surfaceError: _YHBaseColors.red500,
    surfaceErrorWeak: _YHBaseColors.red100,
    surfaceOverlayStrong: _YHBaseColors.black800,
    surfaceOverlay: _YHBaseColors.black500,
    surfaceOverlayWeak: _YHBaseColors.black200,
    surfaceOverlayWeaker: _YHBaseColors.black100,
  );

  // MARK: - 다크 모드 색상 스킴
  static const YHColorScheme dark = YHColorScheme._(
    brightness: Brightness.dark,

    // Custom
    note: Color(0xFFF59E0B),
    gold: Color(0xFFFFBB01),
    textActionSheet: Color(0xFF8BA3CC), // 더 밝게 조정

    // Semantic Colors - Text (다크모드에서는 밝은 색상 사용)
    textDefault: _YHBaseColors.gray100,
    textSub: _YHBaseColors.gray400,
    textDisabled: _YHBaseColors.gray600,
    textPlaceholder: _YHBaseColors.gray500,
    textWhite: _YHBaseColors.white,
    textPrimary: _YHBaseColors.blue400, // 다크모드에서는 더 밝은 블루
    textError: _YHBaseColors.red400,
    textWarning: _YHBaseColors.orange400,

    // Semantic Colors - Icon
    iconDefault: _YHBaseColors.gray100,
    iconSub: _YHBaseColors.gray400,
    iconSubWeak: _YHBaseColors.gray600,
    iconDisabled: _YHBaseColors.gray600,
    iconWhite: _YHBaseColors.white,
    iconPrimary: _YHBaseColors.blue400,
    iconError: _YHBaseColors.red400,
    iconWarning: _YHBaseColors.orange400,

    // Semantic Colors - Stroke
    strokeDefault: _YHBaseColors.gray700,
    strokeWeak: _YHBaseColors.gray800,
    strokeStrong: _YHBaseColors.gray600,
    strokeNeutral: _YHBaseColors.gray500,
    strokeBlack: _YHBaseColors.gray100,
    strokeBlackWeak: _YHBaseColors.gray300,
    strokeWhite: _YHBaseColors.white,
    strokePrimary: _YHBaseColors.blue400,
    strokeError: _YHBaseColors.red400,
    strokeOverlay: _YHBaseColors.gray800,
    strokeTransparent: _YHBaseColors.transparent,

    // Semantic Colors - Background
    backgroundBasement: _YHBaseColors.gray900,
    backgroundDefault: _YHBaseColors.gray950,
    backgroundBasementBlack: _YHBaseColors.gray100,
    backgroundDefaultBlack: _YHBaseColors.gray200,

    // Semantic Colors - Surface
    surfaceDefault: _YHBaseColors.gray700,
    surfaceSubWeak: _YHBaseColors.gray600,
    surfaceSub: _YHBaseColors.gray500,
    surfaceSubStrong: _YHBaseColors.gray400,
    surfaceBlack: _YHBaseColors.gray100,
    surfaceBlackWeak: _YHBaseColors.gray300,
    surfaceNeutral: _YHBaseColors.gray500,
    surfaceDisabled: _YHBaseColors.gray800,
    surfaceDisabledStrong: _YHBaseColors.gray600,
    surfacePrimary: _YHBaseColors.blue600,
    surfacePrimaryWeak: _YHBaseColors.blue900,
    surfacePrimaryWeaker: _YHBaseColors.blue950,
    surfaceError: _YHBaseColors.red600,
    surfaceErrorWeak: _YHBaseColors.red900,
    surfaceOverlayStrong: _YHBaseColors.black800,
    surfaceOverlay: _YHBaseColors.black500,
    surfaceOverlayWeak: _YHBaseColors.black200,
    surfaceOverlayWeaker: _YHBaseColors.black100,
  );
}

// MARK: - 기본 색상 정의 (라이트/다크 모드에서 공통으로 사용)
final class _YHBaseColors {
  // Primary
  static const Color primary = Color.fromARGB(255, 75, 130, 255);

  // Shades
  static const Color white = Color(0xFFFFFFFF);

  // Gray
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);
  static const Color gray950 = Color(0xFF0A0A0A);

  // Alpha
  static const Color transparent = Color(0x00FFFFFF);

  // Alpha Black
  static const Color black100 = Color(0x1A000000); // 10%
  static const Color black200 = Color(0x33000000); // 20%
  static const Color black500 = Color(0x80000000); // 50%
  static const Color black800 = Color(0xCC000000); // 80%

  // Red
  static const Color red100 = Color(0xFFFFE4E3);
  static const Color red400 = Color(0xFFFD716C);
  static const Color red500 = Color(0xFFF6443E);
  static const Color red600 = Color(0xFFE3251F);
  static const Color red900 = Color(0xFF831C19);

  // Orange
  static const Color orange400 = Color(0xFFFA8E43);
  static const Color orange500 = Color(0xFFF76916);

  // Blue
  static const Color blue50 = Color(0xFFF0F7FF);
  static const Color blue100 = Color(0xFFE0EFFE);
  static const Color blue400 = Color(0xFF4CAFF6);
  static const Color blue600 = Color(0xFF1277C9);
  static const Color blue900 = Color(0xFF0D3F6D);
  static const Color blue950 = Color(0xFF092848);
}
