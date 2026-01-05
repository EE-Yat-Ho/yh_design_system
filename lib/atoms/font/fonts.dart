// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

enum YHFontFamily {
  GangwonEduAll, // 강원교육모두 << 20260105 이걸 기본으로 ㄱ
  SpoqaHanSansNeo, // 기본 폰트
  SANGJUDajungdagam, // 필기체
  ;

  /// 폰트별 크기 조정 스케일 팩터
  /// 기준 폰트(SpoqaHanSansNeo)를 1.0으로 하여 다른 폰트들의 실제 렌더링 크기를 일치시킴
  double get sizeScaleFactor {
    switch (this) {
      case YHFontFamily.GangwonEduAll:
        return 1.15; // GangwonEduAll은 작게 보이므로 키움
      case YHFontFamily.SpoqaHanSansNeo:
        return 1.0; // 기준 폰트
      case YHFontFamily.SANGJUDajungdagam:
        return 1.2; // SANGJUDajungdagam이 제일 작게 보이므로 더 많이 키움
    }
  }

  // 코드에서 사용할 폰트 패밀리 이름
  String get fontFamilyName {
    switch (this) {
      case YHFontFamily.GangwonEduAll:
        return "GangwonEduAll";
      case YHFontFamily.SpoqaHanSansNeo:
        return "SpoqaHanSansNeo";
      case YHFontFamily.SANGJUDajungdagam:
        return "SANGJUDajungdagam";
    }
  }

  // 한국어 폰트 이름
  String get koreanName {
    switch (this) {
      case YHFontFamily.GangwonEduAll:
        return "강원교육모두";
      case YHFontFamily.SpoqaHanSansNeo:
        return "SpoqaHanSansNeo";
      case YHFontFamily.SANGJUDajungdagam:
        return "상주다정다감";
    }
  }

  // 한국어 외 폰트 이름
  String get englishName {
    switch (this) {
      case YHFontFamily.GangwonEduAll:
        return "GangwonEduAll";
      case YHFontFamily.SpoqaHanSansNeo:
        return "SpoqaHanSansNeo";
      case YHFontFamily.SANGJUDajungdagam:
        return "SANGJUDajungdagam";
    }
  }
}

enum YHFont {
  bold72,
  bold48,
  bold32,
  bold30, // title0,
  bold28,
  bold24, // title1,
  bold18, // title2,
  bold16, // title3,
  bold14, // title4,
  bold12,

  regular72,
  regular48,
  regular32,
  regular30,
  regular28,
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
      case YHFont.bold72:
      case YHFont.regular72:
        return 72;
      case YHFont.bold48:
      case YHFont.regular48:
        return 48;
      case YHFont.bold32:
      case YHFont.regular32:
        return 32;
      case YHFont.bold30:
      case YHFont.regular30:
        return 30;
      case YHFont.bold28:
      case YHFont.regular28:
        return 28;
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
      case YHFont.bold12:
      case YHFont.regular12:
        return 12;
    }
  }

  FontWeight? get fontWeight {
    switch (this) {
      case YHFont.bold72:
      case YHFont.bold48:
      case YHFont.bold32:
      case YHFont.bold30:
      case YHFont.bold28:
      case YHFont.bold24:
      case YHFont.bold18:
      case YHFont.bold16:
      case YHFont.bold14:
      case YHFont.bold12:
        return FontWeight.w700;
      case YHFont.regular72:
      case YHFont.regular48:
      case YHFont.regular32:
      case YHFont.regular30:
      case YHFont.regular28:
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
  TextStyle style(
      {Color? color, TextDecoration? decoration, YHFontFamily? fontFamily}) {
    final ff = fontFamily ?? YHFont.fontFamily;
    // 폰트 패밀리별 스케일 팩터를 적용하여 실제 렌더링 크기를 일치시킴
    final adjustedFontSize = fontSize * ff.sizeScaleFactor;
    // 폰트가 커진만큼 height는 낮추기
    final adjustedHeight = 1.4 / ff.sizeScaleFactor;

    return TextStyle(
      fontFamily: ff.fontFamilyName, // enum의 폰트 이름 사용
      fontSize: adjustedFontSize,
      fontWeight: fontWeight,
      height: adjustedHeight,
      color: color ?? YHColor.textDefault,
      decorationColor: color ?? YHColor.textDefault,
      decoration: decoration,
      package: "yh_design_system",
    );
  }
}
