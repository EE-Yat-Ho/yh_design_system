// ignore_for_file: type=lint

import 'package:flutter/material.dart';

final class YHColor {
  // static YHColor primary =
  //     const YHColor(color: Color.fromARGB(255, 75, 130, 255));
  // static YHColor primary_a20 =
  //     YHColor(color: primary.color.withAlpha((0.2 * 255).toInt()));
  // static YHColor primary_a30 =
  //     YHColor(color: primary.color.withAlpha((0.3 * 255).toInt()));
  // static YHColor primary_a40 =
  //     YHColor(color: primary.color.withAlpha((0.4 * 255).toInt()));

  // static const YHColor disable =
  //     YHColor(color: Color.fromARGB(255, 172, 172, 172));
  // static const YHColor actionDisabled =
  //     YHColor(color: Color.fromRGBO(191, 199, 212, 1));

  // static const YHColor supportWarning =
  //     YHColor(color: Color.fromRGBO(248, 87, 82, 1));
  // static YHColor supportWarning_a20 =
  //     YHColor(color: supportWarning.color.withAlpha((0.2 * 255).toInt()));
  // static YHColor supportWarning_a30 =
  //     YHColor(color: supportWarning.color.withAlpha((0.3 * 255).toInt()));
  // static YHColor supportWarning_a40 =
  //     YHColor(color: supportWarning.color.withAlpha((0.4 * 255).toInt()));

  // static const YHColor placeholder =
  //     YHColor(color: Color.fromRGBO(191, 199, 212, 1));
  // static const YHColor outline =
  //     YHColor(color: Color.fromRGBO(213, 220, 229, 1));
  // static const YHColor divider =
  //     YHColor(color: Color.fromRGBO(213, 220, 229, 1));
  // static const YHColor dividerWeak =
  //     YHColor(color: Color.fromRGBO(234, 237, 242, 1));

  // static const YHColor contentPrimary =
  //     YHColor(color: Color.fromRGBO(14, 19, 27, 1));
  // static const YHColor contentSecondary =
  //     YHColor(color: Color.fromRGBO(123, 142, 163, 1));
  // static const YHColor contentTertiary =
  //     YHColor(color: Color.fromRGBO(255, 255, 255, 1));

  // static const YHColor surface02 =
  //     YHColor(color: Color.fromRGBO(234, 237, 242, 1));
  // static const YHColor surface03 =
  //     YHColor(color: Color.fromRGBO(246, 247, 249, 1));
  // static const YHColor surface05 =
  //     YHColor(color: Color.fromRGBO(255, 255, 255, 1));

  // static const YHColor gray90 =
  //     YHColor(color: Color.fromRGBO(213, 220, 229, 1));

  // static const YHColor gray50 =
  //     YHColor(color: Color.fromRGBO(249, 249, 249, 1));
  // static const YHColor gray100 =
  //     YHColor(color: Color.fromRGBO(231, 231, 231, 1));
  // static const YHColor gray200 =
  //     YHColor(color: Color.fromRGBO(229, 229, 229, 1));
  // static const YHColor gray300 =
  //     YHColor(color: Color.fromRGBO(217, 217, 217, 1));
  // static const YHColor gray400 =
  //     YHColor(color: Color.fromRGBO(209, 209, 209, 1));
  // static const YHColor gray500 =
  //     YHColor(color: Color.fromRGBO(198, 198, 198, 1));
  // static const YHColor gray600 =
  //     YHColor(color: Color.fromRGBO(180, 180, 180, 1));
  // static const YHColor gray700 =
  //     YHColor(color: Color.fromRGBO(141, 141, 141, 1));
  // static const YHColor gray800 =
  //     YHColor(color: Color.fromRGBO(109, 109, 109, 1));
  // static const YHColor gray900 = YHColor(color: Color.fromRGBO(83, 83, 83, 1));

  // static const YHColor white =
  //     YHColor(color: Color.fromARGB(255, 255, 255, 255));
  // static const YHColor gray =
  //     YHColor(color: Color.fromARGB(255, 172, 172, 172));
  // static const YHColor black = YHColor(color: Color.fromARGB(255, 17, 17, 17));
  // static const YHColor transparent =
  //     YHColor(color: Color.fromRGBO(255, 255, 255, 0));
  // static const YHColor opacity = YHColor(color: Color.fromRGBO(0, 0, 0, 0));

  // static const YHColor red = YHColor(color: Color.fromARGB(255, 255, 0, 0));
  // static const YHColor orange =
  //     YHColor(color: Color.fromARGB(255, 255, 152, 0));
  // static const YHColor yellow =
  //     YHColor(color: Color.fromARGB(255, 255, 215, 0));
  // static const YHColor gold = YHColor(color: Color.fromARGB(255, 255, 187, 0));

  // static const YHColor optionsBG =
  //     YHColor(color: Color.fromARGB(255, 220, 223, 228));
  // static const YHColor grayBG =
  //     YHColor(color: Color.fromRGBO(244, 244, 246, 1));
  // static const YHColor note = YHColor(color: Color.fromARGB(255, 255, 146, 10));

  // static const YHColor actionSheetText =
  //     YHColor(color: Color.fromRGBO(72, 95, 133, 1));

  const YHColor({
    required this.color,
  });

  final Color color;

  static Widget square({
    double width = 10,
    double height = 10,
    required YHColor color, // = YHColor.primary,
  }) {
    return Container(
      width: width,
      height: height,
      color: color.color,
    );
  }

  // Primary
  static Color primary = Color.fromARGB(255, 75, 130, 255);

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

  // Utility methods for withAlpha
  static Color withAlpha(Color color, int alpha) {
    return color.withAlpha(alpha);
  }

  // Semantic Colors - Text
  static const Color textDefault = gray900;
  static const Color textSub = gray500;
  static const Color textDisabled = gray300;
  static const Color textPlaceholder = gray400;
  static const Color textWhite = white;
  static Color textPrimary = primary;
  static const Color textError = red500;
  static const Color textWarning = orange500;

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
  static const Color textActionSheet = Color(0xFF485F85);

  // Semantic Colors - Icon
  static const Color iconDefault = gray900;
  static const Color iconSub = gray500;
  static const Color iconSubWeak = gray300;
  static const Color iconDisabled = gray300;
  static const Color iconWhite = white;
  static Color iconPrimary = primary;
  static const Color iconError = red500;
  static const Color iconWarning = orange500;

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
  static const Color strokeDefault = gray200;
  static const Color strokeWeak = gray100;
  static const Color strokeStrong = gray300;
  static const Color strokeNeutral = gray500;
  static const Color strokeBlack = gray900;
  static const Color strokeBlackWeak = gray700;
  static const Color strokeWhite = white;
  static Color strokePrimary = primary;
  static const Color strokeError = red500;
  static const Color strokeOverlay = gray100;
  static const Color strokeTransparent = transparent;

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
  static const Color backgroundBasement = gray100;
  static const Color backgroundDefault = white;
  static const Color backgroundBasementBlack = gray950;
  static const Color backgroundDefaultBlack = gray800;

  // Semantic Colors - Surface
  static const Color surfaceDefault = white;
  static const Color surfaceSubWeak = gray50;
  static const Color surfaceSub = gray100;
  static const Color surfaceSubStrong = gray200;
  static const Color surfaceBlack = gray900;
  static const Color surfaceBlackWeak = gray700;
  static const Color surfaceNeutral = gray500;
  static const Color surfaceDisabled = gray100;
  static const Color surfaceDisabledStrong = gray300;
  static Color surfacePrimary = primary;
  static const Color surfacePrimaryWeak = blue100;
  static const Color surfacePrimaryWeaker = blue50;
  static const Color surfaceError = red500;
  static const Color surfaceErrorWeak = red100;
  static const Color surfaceOverlayStrong = black800;
  static const Color surfaceOverlay = black500;
  static const Color surfaceOverlayWeak = black200;
  static const Color surfaceOverlayWeaker = black100;

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
}
