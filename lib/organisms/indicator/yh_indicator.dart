import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHIndicator {
  static OverlayEntry? _indicator;
  static String? _currentMessage;
  static Widget? _commonChild;
  static bool _isRemoving = false; // 제거 중인지 추적

  static void show(
      {required BuildContext? context, Widget? child, String? message}) {
    if (context == null) return;

    _currentMessage = message;
    _isRemoving = false; // show 시 제거 상태 해제

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
                      _commonChild ??
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                              color: YHColor.primary.color)),
                  if (_currentMessage != null) ...[
                    const SizedBox(height: 8),
                    YHText(
                        text: _currentMessage!,
                        font: YHFont.regular16,
                        color: YHColor.primary)
                  ],
                ],
              ))));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 제거 중이 아닐 때만 추가
        if (!_isRemoving && _indicator != null) {
          debugPrint('🌀 인디케이터 노출');
          Overlay.of(context).insert(_indicator!);
        }
      });
    } else {
      // 인디케이터 재빌드
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isRemoving && _indicator != null) {
          debugPrint('🌀 인디케이터 재빌드');
          _indicator?.markNeedsBuild();
        }
      });
    }
  }

  static void hide() {
    if (_indicator == null || _isRemoving) return; // 이미 제거중이면 리턴

    _isRemoving = true; // 제거 상태로 설정

    // 인디케이터 제거
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint('🌀 인디케이터 제거');
      if (_indicator != null && _isRemoving) {
        _isRemoving = false;
        _indicator?.remove();
        _indicator = null;
      }
    });
  }

  // 기본적인 인디케이터 위젯 설정하기
  static void setCommonIndicator(Widget child) {
    _commonChild = child;
  }
}
