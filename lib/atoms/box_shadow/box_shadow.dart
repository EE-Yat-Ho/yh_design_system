import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_util/common/theme.dart';

final class YHBoxShadow {
  // 기본 그림자 (다크모드는 없음)
  static List<BoxShadow> defaultShadow({
    Color? color,
    double spreadRadius = 1,
    double blurRadius = 2,
    Offset? offset,
  }) {
    final shadowColor = YHColor.gray500.withValues(alpha: 0.5);
    const shadowOffset = Offset(0, 3);

    return YHTheme.isDarkMode
        ? []
        : [
            BoxShadow(
              color: shadowColor,
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: shadowOffset,
            )
          ];
  }

  // 네오뮤픽 그림자 (다크모드에서도 튀어나온 느낌 가능)
  static List<BoxShadow> neumorphicShadow({
    double spreadRadius = 1,
    double blurRadius = 2,
  }) {
    return YHTheme.isDarkMode
        ?
        // Dark mode: 더 깊고 진한 그림자
        [
            // 어두운 그림자 (오른쪽 아래)
            BoxShadow(
              color: Colors.black.withAlpha(225),
              offset: const Offset(3, 3),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
            // 밝은 하이라이트 (왼쪽 위)
            BoxShadow(
              color: Colors.white.withAlpha(50),
              offset: const Offset(-3, -3),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ]
        :
        // Light mode: 부드러운 그림자
        [
            // 어두운 그림자 (오른쪽 아래)
            BoxShadow(
              color: Colors.black.withAlpha(100),
              offset: const Offset(3, 3),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
            // 밝은 하이라이트 (왼쪽 위)
            BoxShadow(
              color: Colors.white.withAlpha(225),
              offset: const Offset(-3, -3),
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
            ),
          ];
  }
}
