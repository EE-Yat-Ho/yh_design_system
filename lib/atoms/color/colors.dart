// ignore_for_file: type=lint

import 'package:flutter/material.dart';
import 'color_scheme.dart';

final class YHColor {
  /// 현재 컨텍스트의 테마에 따라 적절한 색상 스킴을 반환합니다.
  static YHColorScheme _getColorScheme(BuildContext? context) {
    if (context == null) return YHColorScheme.light;

    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? YHColorScheme.dark
        : YHColorScheme.light;
  }

  /// 현재 컨텍스트 (위젯 트리에서 자동으로 감지)
  static BuildContext? _currentContext;

  /// 컨텍스트를 설정합니다. (앱 루트에서 호출)
  static void setContext(BuildContext context) {
    _currentContext = context;
  }

  /// 현재 색상 스킴을 반환합니다.
  static YHColorScheme get _colorScheme => _getColorScheme(_currentContext);

  // MARK: - Custom
  static Color get note => _colorScheme.note;
  static Color get gold => _colorScheme.gold;
  static Color get textActionSheet => _colorScheme.textActionSheet;

  // MARK: - Semantic

  // Semantic Colors - Text
  static Color get textDefault => _colorScheme.textDefault;
  static Color get textSub => _colorScheme.textSub;
  static Color get textDisabled => _colorScheme.textDisabled;
  static Color get textPlaceholder => _colorScheme.textPlaceholder;
  static Color get textWhite => _colorScheme.textWhite;
  static Color get textPrimary => _colorScheme.textPrimary;
  static Color get textError => _colorScheme.textError;
  static Color get textWarning => _colorScheme.textWarning;

  // Semantic Colors - Text/Accent
  static const Color textAccentRed = red500;
  static const Color textAccentOrange = orange500;
  static const Color textAccentBrown = brown500;
  static const Color textAccentYellow = yellow500;
  static const Color textAccentGreen = green500;
  static const Color textAccentTeal = teal500;
  static const Color textAccentBlue = blue500;
  static const Color textAccentViolet = violet500;
  static const Color textAccentPink = pink500;
  static const Color textAccentBlackAlpha = black900;
  static const Color textAccentBlackAlphaSub = black500;
  static const Color textAccentWhiteAlpha = white900;
  static const Color textAccentWhiteAlphaSub = white500;

  // Semantic Colors - Icon
  static Color get iconDefault => _colorScheme.iconDefault;
  static Color get iconSub => _colorScheme.iconSub;
  static Color get iconSubWeak => _colorScheme.iconSubWeak;
  static Color get iconDisabled => _colorScheme.iconDisabled;
  static Color get iconWhite => _colorScheme.iconWhite;
  static Color get iconPrimary => _colorScheme.iconPrimary;
  static Color get iconError => _colorScheme.iconError;
  static Color get iconWarning => _colorScheme.iconWarning;

  // Semantic Colors - Icon/Accent
  static const Color iconAccentRed = red500;
  static const Color iconAccentOrange = orange500;
  static const Color iconAccentBrown = brown500;
  static const Color iconAccentYellow = yellow500;
  static const Color iconAccentGreen = green500;
  static const Color iconAccentTeal = teal500;
  static const Color iconAccentBlue = blue500;
  static const Color iconAccentViolet = violet500;
  static const Color iconAccentPink = pink500;
  static const Color iconAccentBlackAlpha = black900;
  static const Color iconAccentBlackAlphaSub = black500;
  static const Color iconAccentWhiteAlpha = white900;
  static const Color iconAccentWhiteAlphaSub = white500;

  // Semantic Colors - Stroke
  static Color get strokeDefault => _colorScheme.strokeDefault;
  static Color get strokeWeak => _colorScheme.strokeWeak;
  static Color get strokeStrong => _colorScheme.strokeStrong;
  static Color get strokeNeutral => _colorScheme.strokeNeutral;
  static Color get strokeBlack => _colorScheme.strokeBlack;
  static Color get strokeBlackWeak => _colorScheme.strokeBlackWeak;
  static Color get strokeWhite => _colorScheme.strokeWhite;
  static Color get strokePrimary => _colorScheme.strokePrimary;
  static Color get strokeError => _colorScheme.strokeError;
  static Color get strokeOverlay => _colorScheme.strokeOverlay;
  static Color get strokeTransparent => _colorScheme.strokeTransparent;

  // Semantic Colors - Stroke/Accent
  static const Color strokeAccentRed = red500;
  static const Color strokeAccentOrange = orange500;
  static const Color strokeAccentBrown = brown500;
  static const Color strokeAccentYellow = yellow500;
  static const Color strokeAccentGreen = green500;
  static const Color strokeAccentTeal = teal500;
  static const Color strokeAccentBlue = blue500;
  static const Color strokeAccentViolet = violet500;
  static const Color strokeAccentPink = pink500;

  // Semantic Colors - Background
  static Color get backgroundBasement => _colorScheme.backgroundBasement;
  static Color get backgroundDefault => _colorScheme.backgroundDefault;
  static Color get backgroundBasementBlack =>
      _colorScheme.backgroundBasementBlack;
  static Color get backgroundDefaultBlack =>
      _colorScheme.backgroundDefaultBlack;

  // Semantic Colors - Surface
  static Color get surfaceDefault => _colorScheme.surfaceDefault;
  static Color get surfaceSubWeak => _colorScheme.surfaceSubWeak;
  static Color get surfaceSub => _colorScheme.surfaceSub;
  static Color get surfaceSubStrong => _colorScheme.surfaceSubStrong;
  static Color get surfaceBlack => _colorScheme.surfaceBlack;
  static Color get surfaceBlackWeak => _colorScheme.surfaceBlackWeak;
  static Color get surfaceNeutral => _colorScheme.surfaceNeutral;
  static Color get surfaceDisabled => _colorScheme.surfaceDisabled;
  static Color get surfaceDisabledStrong => _colorScheme.surfaceDisabledStrong;
  static Color get surfacePrimary => _colorScheme.surfacePrimary;
  static Color get surfacePrimaryWeak => _colorScheme.surfacePrimaryWeak;
  static Color get surfacePrimaryWeaker => _colorScheme.surfacePrimaryWeaker;
  static Color get surfaceError => _colorScheme.surfaceError;
  static Color get surfaceErrorWeak => _colorScheme.surfaceErrorWeak;
  static Color get surfaceOverlayStrong => _colorScheme.surfaceOverlayStrong;
  static Color get surfaceOverlay => _colorScheme.surfaceOverlay;
  static Color get surfaceOverlayWeak => _colorScheme.surfaceOverlayWeak;
  static Color get surfaceOverlayWeaker => _colorScheme.surfaceOverlayWeaker;

  // Semantic Colors - Surface/Accent
  static const Color surfaceAccentRed = red500;
  static const Color surfaceAccentRedWeak = red100;
  static const Color surfaceAccentOrange = orange500;
  static const Color surfaceAccentOrangeWeak = orange100;
  static const Color surfaceAccentBrown = brown500;
  static const Color surfaceAccentBrownWeak = brown100;
  static const Color surfaceAccentYellow = yellow500;
  static const Color surfaceAccentYellowWeak = yellow100;
  static const Color surfaceAccentGreen = green500;
  static const Color surfaceAccentGreenWeak = green100;
  static const Color surfaceAccentTeal = teal500;
  static const Color surfaceAccentTealWeak = teal100;
  static const Color surfaceAccentBlue = blue500;
  static const Color surfaceAccentBlueWeak = blue100;
  static const Color surfaceAccentViolet = violet500;
  static const Color surfaceAccentVioletWeak = violet100;
  static const Color surfaceAccentPink = pink500;
  static const Color surfaceAccentPinkWeak = pink100;

  // MARK: - Base

  // Primary
  static Color get primary => _colorScheme.surfacePrimary;

  // Shades
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Gray
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFCCD0D7);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF78808F);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);
  static const Color gray950 = Color(0xFF030712);

  // Alpha
  static const Color transparent = Color(0x00FFFFFF);
  static const Color opacity = Color(0x00000000);

  // Alpha White
  static const Color white50 = Color(0x0DFFFFFF); // 5%
  static const Color white100 = Color(0x1AFFFFFF); // 10%
  static const Color white200 = Color(0x33FFFFFF); // 20%
  static const Color white300 = Color(0x4DFFFFFF); // 30%
  static const Color white400 = Color(0x66FFFFFF); // 40%
  static const Color white500 = Color(0x80FFFFFF); // 50%
  static const Color white600 = Color(0x99FFFFFF); // 60%
  static const Color white700 = Color(0xB3FFFFFF); // 70%
  static const Color white800 = Color(0xCCFFFFFF); // 80%
  static const Color white900 = Color(0xE6FFFFFF); // 90%
  static const Color white950 = Color(0xF2FFFFFF); // 95%

  // Alpha Black
  static const Color black50 = Color(0x0D000000); // 5%
  static const Color black100 = Color(0x1A000000); // 10%
  static const Color black200 = Color(0x33000000); // 20%
  static const Color black300 = Color(0x4D000000); // 30%
  static const Color black400 = Color(0x66000000); // 40%
  static const Color black500 = Color(0x80000000); // 50%
  static const Color black600 = Color(0x99000000); // 60%
  static const Color black700 = Color(0xB3000000); // 70%
  static const Color black800 = Color(0xCC000000); // 80%
  static const Color black900 = Color(0xE6000000); // 90%
  static const Color black950 = Color(0xF2000000); // 95%

  // Red
  static const Color red50 = Color(0xFFFEF4F4);
  static const Color red100 = Color(0xFFFFE4E3);
  static const Color red200 = Color(0xFFFFCAC8);
  static const Color red300 = Color(0xFFFFA4A1);
  static const Color red400 = Color(0xFFFD716C);
  static const Color red500 = Color(0xFFF6443E);
  static const Color red600 = Color(0xFFE3251F);
  static const Color red700 = Color(0xFFBF1C16);
  static const Color red800 = Color(0xFF9E1A16);
  static const Color red900 = Color(0xFF831C19);
  static const Color red950 = Color(0xFF470A08);

  // Orange
  static const Color orange50 = Color(0xFFFCF5ED);
  static const Color orange100 = Color(0xFFFFEDD9);
  static const Color orange200 = Color(0xFFFDD4AB);
  static const Color orange300 = Color(0xFFFCB475);
  static const Color orange400 = Color(0xFFFA8E43);
  static const Color orange500 = Color(0xFFF76916);
  static const Color orange600 = Color(0xFFE8500E);
  static const Color orange700 = Color(0xFFC03B0E);
  static const Color orange800 = Color(0xFF993013);
  static const Color orange900 = Color(0xFF7B2913);
  static const Color orange950 = Color(0xFF421208);

  // Yellow
  static const Color yellow50 = Color(0xFFFCF8E7);
  static const Color yellow100 = Color(0xFFFEF4CE);
  static const Color yellow200 = Color(0xFFFEE78A);
  static const Color yellow300 = Color(0xFFFDD847);
  static const Color yellow400 = Color(0xFFFFCA0A);
  static const Color yellow500 = Color(0xFFFFBB01);
  static const Color yellow600 = Color(0xFFE0A904);
  static const Color yellow700 = Color(0xFFB88F08);
  static const Color yellow800 = Color(0xFF997C12);
  static const Color yellow900 = Color(0xFF806A14);
  static const Color yellow950 = Color(0xFF4D3F07);

  // Brown
  static const Color brown50 = Color(0xFFFAF5F0);
  static const Color brown100 = Color(0xFFF4ECE0);
  static const Color brown200 = Color(0xFFE9D8BF);
  static const Color brown300 = Color(0xFFDBBD96);
  static const Color brown400 = Color(0xFFCC9E6E);
  static const Color brown500 = Color(0xFFC0844F);
  static const Color brown600 = Color(0xFFB27144);
  static const Color brown700 = Color(0xFF94593A);
  static const Color brown800 = Color(0xFF784934);
  static const Color brown900 = Color(0xFF613D2D);
  static const Color brown950 = Color(0xFF341F16);

  // Green
  static const Color green50 = Color(0xFFF3FBF2);
  static const Color green100 = Color(0xFFE3F6E2);
  static const Color green200 = Color(0xFFC8EDC5);
  static const Color green300 = Color(0xFF9CDD98);
  static const Color green400 = Color(0xFF6AC464);
  static const Color green500 = Color(0xFF46AD40);
  static const Color green600 = Color(0xFF358A2F);
  static const Color green700 = Color(0xFF2B6D28);
  static const Color green800 = Color(0xFF275724);
  static const Color green900 = Color(0xFF20481F);
  static const Color green950 = Color(0xFF0C270C);

  // Teal
  static const Color teal50 = Color(0xFFEBFCFD);
  static const Color teal100 = Color(0xFFD5F6F8);
  static const Color teal200 = Color(0xFFB0ECF1);
  static const Color teal300 = Color(0xFF7ADCE6);
  static const Color teal400 = Color(0xFF36BFCF);
  static const Color teal500 = Color(0xFF21A8B9);
  static const Color teal600 = Color(0xFF1E879C);
  static const Color teal700 = Color(0xFF1F6D7F);
  static const Color teal800 = Color(0xFF215969);
  static const Color teal900 = Color(0xFF204B59);
  static const Color teal950 = Color(0xFF10313C);

  // Blue
  static const Color blue50 = Color(0xFFF0F7FF);
  static const Color blue100 = Color(0xFFE0EFFE);
  static const Color blue200 = Color(0xFFBBDFFC);
  static const Color blue300 = Color(0xFF7FC4FA);
  static const Color blue400 = Color(0xFF4CAFF6);
  static const Color blue500 = Color(0xFF1F98F0);
  static const Color blue600 = Color(0xFF1277C9);
  static const Color blue700 = Color(0xFF0D5DA3);
  static const Color blue800 = Color(0xFF094B83);
  static const Color blue900 = Color(0xFF0D3F6D);
  static const Color blue950 = Color(0xFF092848);

  // Violet
  static const Color violet50 = Color(0xFFF5F6FD);
  static const Color violet100 = Color(0xFFE7E8FB);
  static const Color violet200 = Color(0xFFCECFF7);
  static const Color violet300 = Color(0xFFAFB0F2);
  static const Color violet400 = Color(0xFF9791ED);
  static const Color violet500 = Color(0xFF8474E0);
  static const Color violet600 = Color(0xFF7459D2);
  static const Color violet700 = Color(0xFF6549B9);
  static const Color violet800 = Color(0xFF523E95);
  static const Color violet900 = Color(0xFF453877);
  static const Color violet950 = Color(0xFF292145);

  // Pink
  static const Color pink50 = Color(0xFFFDF2F8);
  static const Color pink100 = Color(0xFFFBE7F3);
  static const Color pink200 = Color(0xFFFBCFE8);
  static const Color pink300 = Color(0xFFF9A9D4);
  static const Color pink400 = Color(0xFFF471B6);
  static const Color pink500 = Color(0xFFEC4899);
  static const Color pink600 = Color(0xFFDB2877);
  static const Color pink700 = Color(0xFFBE195D);
  static const Color pink800 = Color(0xFF9D174D);
  static const Color pink900 = Color(0xFF831743);
  static const Color pink950 = Color(0xFF500724);

  // MARK: - Utility

  static Widget square(
      {double width = 10, double height = 10, required Color color}) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
