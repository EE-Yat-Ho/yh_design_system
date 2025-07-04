import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHIndicator {
  static OverlayEntry? _indicatorOverlay;
  // 인디케이터 아래에 노출할 메시지
  static String? _currentMessage;
  // 기본 인디케이터 위젯
  static Widget _defaultIndicatorWidget = SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(color: YHColor.primary.color));
  // 제거 중인지 추적
  static bool _isRemoving = false;

  static void show({
    required BuildContext? context,
    Widget? indicatorWidget,
    String? message,
  }) {
    debugPrint('🌀 show 호출');

    if (context == null) {
      debugPrint("🚨🌀 인디케이터 노출 실패. context is null");
      return;
    }

    _currentMessage = message;
    _isRemoving = false; // show 시 제거 상태 해제

    if (_indicatorOverlay == null) {
      // 새로운 인디케이터 노출
      _indicatorOverlay = OverlayEntry(
          builder: (_) => Container(
              color: Colors.black.withValues(alpha: 0.01),
              width: double.infinity, // 터치를 막기위함
              height: double.infinity,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  indicatorWidget ?? _defaultIndicatorWidget,
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
        if (!_isRemoving && _indicatorOverlay != null) {
          debugPrint('🌀 인디케이터 노출');
          Overlay.of(context).insert(_indicatorOverlay!);
        }
      });
    } else {
      // 인디케이터 재빌드
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_isRemoving && _indicatorOverlay != null) {
          debugPrint('🌀 인디케이터 재빌드');
          _indicatorOverlay?.markNeedsBuild();
        }
      });
    }
  }

  static void hide() {
    debugPrint('🌀 hide 호출');
    if (_indicatorOverlay == null || _isRemoving) return; // 이미 제거중이면 리턴

    _isRemoving = true; // 제거 상태로 설정

    // 인디케이터 제거
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint('🌀 인디케이터 제거');
      if (_indicatorOverlay != null && _isRemoving) {
        _isRemoving = false;
        _indicatorOverlay?.remove();
        _indicatorOverlay = null;
      }
    });
  }

  // 기본적인 인디케이터 위젯 설정하기
  static void setCommonIndicator(Widget child) {
    _defaultIndicatorWidget = child;
  }
}
