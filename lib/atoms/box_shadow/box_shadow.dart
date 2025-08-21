import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/utils/theme.dart';

final class YHBoxShadow {
  // 기본 그림자 생성. (매개변수로 커스텀 가능)
  static BoxShadow defaultShadow({
    Color? color,
    double spreadRadius = 1,
    double blurRadius = 2,
    Offset? offset,
  }) {
    final shadowColor = color ??
        (YHTheme.isDarkMode
            ? YHColor.black.withValues(alpha: 0.3)
            : YHColor.gray500.withValues(alpha: 0.5));

    final shadowOffset = offset ??
        (YHTheme.isDarkMode ? const Offset(0, 1) : const Offset(0, 3));
    return BoxShadow(
      color: shadowColor,
      spreadRadius: spreadRadius,
      blurRadius: blurRadius,
      offset: shadowOffset,
    );
  }
}
