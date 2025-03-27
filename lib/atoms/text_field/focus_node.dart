import 'package:flutter/material.dart';

final class YHFocusNode extends FocusNode {
  static int count = 0;

  YHFocusNode() {
    count++;
    debugPrint("🎂 $runtimeType 생성($count)");
  }

  @override
  void dispose() {
    count--;
    debugPrint("🖐️ $runtimeType 해제($count)");
    super.dispose();
  }
}
