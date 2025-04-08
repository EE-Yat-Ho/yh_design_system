import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHIndicator {
  static OverlayEntry? _indicator;
  static String? _currentMessage;

  static void show(
      {required BuildContext? context, Widget? child, String? message}) {
    if (context == null) return;

    _currentMessage = message;

    if (_indicator == null) {
      // 새로운 인디케이터 노출
      _indicator = OverlayEntry(
          builder: (_) => Container(
              color: Colors.black.withValues(alpha: 0.01),
              width: double.infinity, // 터치를 막기위함
              height: double.infinity,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child ??
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                              color: YHColor.primary.color)),
                  if (_currentMessage != null) ...[
                    const SizedBox(height: 10),
                    YHText(
                        text: _currentMessage!,
                        font: YHFont.regular16,
                        color: YHColor.primary)
                  ],
                ],
              ))));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Overlay.of(context).insert(_indicator!);
      });

      //   if (_indicator == null) {
      //     Widget body = CircularProgressIndicator(color: YHColor.primary.color);
      //     if (child != null) {
      //       body = child;
      //     } else if (text != null) {
      //       body = Column(
      //         spacing: 4,
      //         children: [
      //           CircularProgressIndicator(color: YHColor.primary.color),
      //           YHText(text: text.text, font: text.font, color: text.color),
      //         ],
      //       );
      //     }

      //     WidgetsBinding.instance.addPostFrameCallback((_) {
      //       Overlay.of(context).insert(_indicator!);
      //     });
      //   }
      // }

      // _indicator = OverlayEntry(
      //   builder: (_) => Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         body,
      //         if (_currentMessage != null) ...[
      //           const SizedBox(height: 10),
      //           YHText(
      //               text: _currentMessage!,
      //               font: YHFont.regular16,
      //               color: YHColor.primary)
      //         ],
      //       ],
      //     ),
      //   ),
      // );
    } else {
      // 인디케이터 재빌드
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _indicator!.markNeedsBuild();
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
