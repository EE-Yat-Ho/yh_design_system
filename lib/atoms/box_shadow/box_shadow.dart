import 'package:flutter/material.dart';

class YHBoxShadow {
  static BoxShadow create({
    Color? color,
    double spreadRadius = 0,
    double blurRadius = 3,
    Offset offset = Offset.zero,
  }) {
    return BoxShadow(
      color: color ?? Colors.black.withAlpha(54), // 그림자 색상 및 투명도
      spreadRadius: spreadRadius, // 그림자의 퍼짐 정도
      blurRadius: blurRadius, // 그림자의 흐림 정도
      offset: offset, // X, Y 축으로 그림자 이동
    );
  }
}
