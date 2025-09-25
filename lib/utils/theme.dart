import 'package:flutter/services.dart';

final class YHTheme {
  static bool isDarkMode = false;

  static SystemUiOverlayStyle systemOverlayStyle = YHTheme.isDarkMode
      ? SystemUiOverlayStyle.light
      : SystemUiOverlayStyle.dark;
}
