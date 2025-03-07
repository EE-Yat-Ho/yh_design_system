import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHIndicator {
  static OverlayEntry? _indicator;

  static void show(
      {required BuildContext? context, Widget? child, YHText? text}) {
    // 앱이 실행중인 상태라면 null일 수가 없지만,
    // 위젯 트리에 붙지 않은 상태일 수 있기에 null을 반환할 수 있음.
    // BuildContext? context = navigatorKey.currentContext;

    if (context == null) return;

    if (_indicator == null) {
      Widget body = CircularProgressIndicator(color: YHColor.primary.color);
      if (child != null) {
        body = child;
      } else if (text != null) {
        body = Column(
          spacing: 4,
          children: [
            CircularProgressIndicator(color: YHColor.primary.color),
            YHText(text: text.text, font: text.font, color: text.color),
          ],
        );
      }

      _indicator = OverlayEntry(
          builder: (_) => Container(
              color: Colors.black.withValues(alpha: 0.01),
              width: double.infinity,
              height: double.infinity,
              child: Center(child: body)));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Overlay.of(context).insert(_indicator!);
      });
    }
  }

  static void hide() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_indicator != null) {
        _indicator?.remove();
        _indicator = null;
      }
    });
  }
}
