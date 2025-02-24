// ignore_for_file: type=lint

import 'package:flutter/material.dart';

class YHColor {
  static YHColor primary =
      const YHColor(color: Color.fromARGB(255, 75, 130, 255));

  static const YHColor disable =
      YHColor(color: Color.fromARGB(255, 172, 172, 172));
  static const YHColor actionDisabled =
      YHColor(color: Color.fromRGBO(191, 199, 212, 1));
  static const YHColor supportWarning =
      YHColor(color: Color.fromRGBO(248, 87, 82, 1));
  static const YHColor placeholder =
      YHColor(color: Color.fromRGBO(191, 199, 212, 1));
  static const YHColor outline =
      YHColor(color: Color.fromRGBO(213, 220, 229, 1));
  static const YHColor divider =
      YHColor(color: Color.fromRGBO(213, 220, 229, 1));
  static const YHColor dividerWeak =
      YHColor(color: Color.fromRGBO(234, 237, 242, 1));

  static const YHColor contentPrimary =
      YHColor(color: Color.fromRGBO(14, 19, 27, 1));
  static const YHColor contentSecondary =
      YHColor(color: Color.fromRGBO(123, 142, 163, 1));
  static const YHColor contentTertiary =
      YHColor(color: Color.fromRGBO(255, 255, 255, 1));

  static const YHColor surface02 =
      YHColor(color: Color.fromRGBO(234, 237, 242, 1));
  static const YHColor surface03 =
      YHColor(color: Color.fromRGBO(246, 247, 249, 1));
  static const YHColor surface05 =
      YHColor(color: Color.fromRGBO(255, 255, 255, 1));

  static const YHColor gray90 =
      YHColor(color: Color.fromRGBO(213, 220, 229, 1));

  static const YHColor gray50 =
      YHColor(color: Color.fromRGBO(249, 249, 249, 1));
  static const YHColor gray100 =
      YHColor(color: Color.fromRGBO(231, 231, 231, 1));
  static const YHColor gray200 =
      YHColor(color: Color.fromRGBO(229, 229, 229, 1));
  static const YHColor gray300 =
      YHColor(color: Color.fromRGBO(217, 217, 217, 1));
  static const YHColor gray400 =
      YHColor(color: Color.fromRGBO(209, 209, 209, 1));
  static const YHColor gray500 =
      YHColor(color: Color.fromRGBO(198, 198, 198, 1));
  static const YHColor gray600 =
      YHColor(color: Color.fromRGBO(180, 180, 180, 1));
  static const YHColor gray700 =
      YHColor(color: Color.fromRGBO(141, 141, 141, 1));
  static const YHColor gray800 =
      YHColor(color: Color.fromRGBO(109, 109, 109, 1));
  static const YHColor gray900 = YHColor(color: Color.fromRGBO(83, 83, 83, 1));

  static const YHColor white =
      YHColor(color: Color.fromARGB(255, 255, 255, 255));
  static const YHColor gray =
      YHColor(color: Color.fromARGB(255, 172, 172, 172));
  static const YHColor black = YHColor(color: Color.fromARGB(255, 17, 17, 17));
  static const YHColor transparent = YHColor(color: Color.fromRGBO(0, 0, 0, 0));
  static const YHColor opacity =
      YHColor(color: Color.fromRGBO(255, 255, 255, 0));
  static const YHColor red = YHColor(color: Color.fromARGB(255, 255, 0, 0));
  static const YHColor gold = YHColor(color: Color.fromARGB(255, 255, 187, 0));

  static const YHColor optionsBG =
      YHColor(color: Color.fromARGB(255, 220, 223, 228));
  static const YHColor grayBG =
      YHColor(color: Color.fromRGBO(244, 244, 246, 1));
  static const YHColor note = YHColor(color: Color.fromARGB(255, 255, 146, 10));

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
}
