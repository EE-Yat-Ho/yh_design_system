// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

enum YHFontFamily {
  SpoqaHanSansNeo, // 기본 폰트 (nemo)
  SANGJUDajungdagam // 필기체 (memory_log)
}

enum YHFont {
  bold30, // title0,
  bold24, // title1,
  bold18, // title2,
  bold16, // title3,
  bold14, // title4,

  regular32,
  regular30,
  regular24,
  regular22,
  regular20, // body1,
  regular18, // body2,
  regular16, // body3,
  regular14, // body5,
  regular12; // body6, label2

  const YHFont();

  // 앱 전체 폰트 설정
  static YHFontFamily fontFamily = YHFontFamily.SpoqaHanSansNeo;

  double get fontSize {
    switch (this) {
      case YHFont.regular32:
        return 32;
      case YHFont.bold30:
      case YHFont.regular30:
        return 30;
      case YHFont.bold24:
      case YHFont.regular24:
        return 24;
      case YHFont.regular22:
        return 22;
      case YHFont.regular20:
        return 20;
      case YHFont.bold18:
      case YHFont.regular18:
        return 18;
      case YHFont.bold16:
      case YHFont.regular16:
        return 16;
      case YHFont.bold14:
      case YHFont.regular14:
        return 14;
      case YHFont.regular12:
        return 12;
    }
  }

  FontWeight? get fontWeight {
    switch (this) {
      case YHFont.bold30:
      case YHFont.bold24:
      case YHFont.bold18:
      case YHFont.bold16:
      case YHFont.bold14:
        return FontWeight.w700;
      case YHFont.regular32:
      case YHFont.regular30:
      case YHFont.regular24:
      case YHFont.regular22:
      case YHFont.regular20:
      case YHFont.regular18:
      case YHFont.regular16:
      case YHFont.regular14:
      case YHFont.regular12:
        return FontWeight.w500;
    }
  }
}

extension YHFontEx on YHFont {
  TextStyle style({Color? color, TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: YHFont.fontFamily.name, // enum의 폰트 이름 사용
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 1.4,
      color: color ?? YHColor.contentPrimary.color,
      decoration: decoration,
      package: "yh_design_system",
    );
  }
}
