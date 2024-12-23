import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

enum YHFont {
  title1,
  title2,
  title3,
  title4,

  label2,

  body2,
  body3,
  body5;

  const YHFont();

  String get fontFamily {
    return "SpoqaHanSansNeo";
  }

  double get fontSize {
    switch (this) {
      case YHFont.title1:
        return 24;
      case YHFont.title2:
        return 18;
      case YHFont.title3:
        return 16;
      case YHFont.title4:
        return 14;
      case YHFont.label2:
        return 12;
      case YHFont.body2:
        return 18;
      case YHFont.body3:
        return 16;
      case YHFont.body5:
        return 14;
    }
  }

  FontWeight? get fontWeight {
    switch (this) {
      case YHFont.title1:
        return FontWeight.w700;
      case YHFont.title2:
        return FontWeight.w700;
      case YHFont.title3:
        return FontWeight.w700;
      case YHFont.title4:
        return FontWeight.w700;
      case YHFont.label2:
        return FontWeight.w500;
      case YHFont.body2:
        return FontWeight.w500;
      case YHFont.body3:
        return FontWeight.w500;
      case YHFont.body5:
        return FontWeight.w500;
    }
  }
}

extension YHFontEx on YHFont {
  TextStyle style({Color? color}) {
    return TextStyle(
      fontFamily: fontFamily, // enum의 폰트 이름 사용
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: 1.4,
      color: color ?? YHColor.contentPrimary.color,
    );
  }
}
