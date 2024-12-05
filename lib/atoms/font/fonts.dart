import 'package:flutter/material.dart';

enum YHFont {
  h0(size: 30, weight: YHFontWeight.bold),
  h1(size: 24, weight: YHFontWeight.bold),
  h2(size: 22, weight: YHFontWeight.bold),
  h3(size: 20, weight: YHFontWeight.bold),
  h4(size: 18, weight: YHFontWeight.bold),
  h5(size: 16, weight: YHFontWeight.bold),
  h6(size: 14, weight: YHFontWeight.bold),
  bold13(size: 13, weight: YHFontWeight.bold),
  bold14(size: 14, weight: YHFontWeight.bold),
  bold18(size: 18, weight: YHFontWeight.bold),
  regular18(size: 18, weight: YHFontWeight.regular),
  regular16(size: 16, weight: YHFontWeight.regular),
  regular14(size: 14, weight: YHFontWeight.regular),
  regular12(size: 12, weight: YHFontWeight.regular),

  title(size: 40, weight: YHFontWeight.regular),

  medium12(size: 12, weight: YHFontWeight.medium),
  medium14(size: 14, weight: YHFontWeight.medium),
  medium16(size: 16, weight: YHFontWeight.medium);

  const YHFont({
    required this.size,
    required this.weight,
  });

  final double size;
  final YHFontWeight weight;

  FontWeight get fontWeight => weight.fontweight();
}

enum YHFontWeight {
  regular,
  medium,
  bold;
  // semiBold,
  // extraBold,
  // ultraBold,

  FontWeight fontweight() {
    switch (this) {
      case regular:
        return FontWeight.w400;
      case medium:
        return FontWeight.w600;
      case bold:
        return FontWeight.w700;
    }
  }
}
