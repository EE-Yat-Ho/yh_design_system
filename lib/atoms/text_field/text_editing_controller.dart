import 'package:flutter/material.dart';

final class YHTextEditingController extends TextEditingController {
  static int count = 0;

  YHTextEditingController({super.text}) {
    count++;
    debugPrint("🎂 $runtimeType 생성($count) $text");
  }

  @override
  void dispose() {
    count--;
    debugPrint("🖐️ $runtimeType 해제($count) $text");
    super.dispose();
  }
}
