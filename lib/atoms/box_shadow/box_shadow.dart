import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_util/common/theme.dart';

final class YHBoxShadow {
  // 기본 그림자 생성. (매개변수로 커스텀 가능)
  static List<BoxShadow> defaultShadow({
    Color? color,
    double spreadRadius = 1,
    double blurRadius = 2,
    Offset? offset,
  }) {
    final shadowColor = color ??
        (YHTheme.isDarkMode
            ? YHColor.transparent
            : YHColor.gray500.withValues(alpha: 0.5));

    final shadowOffset = offset ??
        (YHTheme.isDarkMode ? const Offset(0, 0) : const Offset(0, 3));
    // return BoxShadow(
    //   color: shadowColor,
    //   spreadRadius: spreadRadius,
    //   blurRadius: blurRadius,
    //   offset: shadowOffset,
    // ),
    return YHTheme.isDarkMode
        ?
        // Dark mode: 더 깊고 진한 그림자
        [
            // 어두운 그림자 (오른쪽 아래)
            BoxShadow(
              color: Colors.black.withAlpha(225),
              offset: const Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 1,
            ),
            // 밝은 하이라이트 (왼쪽 위)
            BoxShadow(
              color: Colors.white.withAlpha(50),
              offset: const Offset(-3, -3),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ]
        :
        // Light mode: 부드러운 그림자
        [
            // 어두운 그림자 (오른쪽 아래)
            BoxShadow(
              color: Colors.black.withAlpha(150),
              offset: const Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 1,
            ),
            // 밝은 하이라이트 (왼쪽 위)
            BoxShadow(
              color: Colors.white.withAlpha(225),
              offset: const Offset(-3, -3),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ];
  }
}
