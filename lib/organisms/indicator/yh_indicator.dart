import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';

final class YHIndicator {
  static OverlayEntry? _indicatorOverlay;
  // 인디케이터 아래에 노출할 메시지
  static String? _currentMessage;
  // 빌드 콜백 함수에서 indicator를 어떻게 할지 결정한 state
  static bool _isShowing = false;
  // 빌드 콜백 함수의 중복 요청 방지
  static bool _isUpdating = false;

  static void show({
    required BuildContext? context,
    Widget? indicatorWidget,
    String? message,
  }) {
    debugPrint('🌀 show 호출');

    if (context == null) {
      debugPrint("🚨🌀 인디케이터 노출 실패. context가 null임");
      return;
    }

    if (!context.mounted) {
      debugPrint("🚨🌀 인디케이터 노출 실패. context가 mounted가 아님");
      return;
    }

    _currentMessage = message;
    _isShowing = true;

    _updateIndicator(
      context: context,
      indicatorWidget: indicatorWidget,
    );
  }

  static void hide() {
    debugPrint('🌀 hide 호출');
    _isShowing = false;
    _updateIndicator();
  }

  static void _updateIndicator({
    BuildContext? context,
    Widget? indicatorWidget,
  }) {
    if (_isUpdating) {
      debugPrint("🚨🌀 인디케이터 업데이트 중이라 무시됨");
      return;
    }
    _isUpdating = true;
    // 상태값에 따라 인디케이터 노출, 제거, 재빌드 결정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isUpdating = false;

      if (_isShowing &&
          context != null &&
          context.mounted &&
          _indicatorOverlay == null) {
        debugPrint('🌀 인디케이터 노출');
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
        Overlay.of(context).insert(_indicatorOverlay!);
      } else if (_isShowing &&
          context != null &&
          context.mounted &&
          _indicatorOverlay != null) {
        debugPrint('🌀 인디케이터 재빌드');
        _indicatorOverlay?.markNeedsBuild();
      } else {
        debugPrint('🌀 인디케이터 제거');
        _indicatorOverlay?.remove();
        _indicatorOverlay = null;
      }
    });
  }

  // 기본적인 인디케이터 위젯 설정하기
  static void setCommonIndicator(Widget child) {
    _defaultIndicatorWidget = child;
  }

  // 기본 인디케이터 위젯
  static Widget _defaultIndicatorWidget = SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(color: YHColor.primary));
}
