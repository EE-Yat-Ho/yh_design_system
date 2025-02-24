import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

final class YHIndicator {
  static OverlayEntry? _indicator;

  static void show({required BuildContext? context, Widget? child}) {
    // 앱이 실행중인 상태라면 null일 수가 없지만,
    // 위젯 트리에 붙지 않은 상태일 수 있기에 null을 반환할 수 있음.
    // BuildContext? context = navigatorKey.currentContext;

    if (context == null) return;

    if (_indicator == null) {
      _indicator = OverlayEntry(
          builder: (_) => Container(
                color: Colors.black.withValues(alpha: 0.01),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                    child: child ??
                        CircularProgressIndicator(
                            color: YHColor.primary.color)),
              ));
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
