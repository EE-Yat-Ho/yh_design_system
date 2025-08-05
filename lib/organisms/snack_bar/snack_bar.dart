import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/text/text.dart';

enum SnackBarVariant { defaults, success, warning, error }

final class YHSnackBar extends StatelessWidget {
  static const moveDuration = Duration(milliseconds: 250);
  static const waitDuration = Duration(milliseconds: 3000);

  // 토스트를 보여주는 함수
  static void show(
    BuildContext context,
    String message, {
    SnackBarVariant variant = SnackBarVariant.defaults,
  }) {
    OverlayEntry? overlayEntry;
    bool isDismissed = false;

    // 애니메이션 컨트롤러 생성
    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: moveDuration,
    );

    // 페이드인/아웃과 슬라이드를 위한 Curves 애니메이션
    final animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    // 스낵바를 닫는 함수
    // 3초 후 or 터치시 호출
    void dismissSnackBar() {
      try {
        if (isDismissed) return;
        isDismissed = true;

        animationController.reverse().then((_) {
          overlayEntry?.remove();
          animationController.dispose();
        });
      } catch (e) {
        debugPrint("⚠️ 스낵바 닫기 에러 발생: $e");
      }
    }

    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: YHSnackBar(
            message: message,
            animation: animation,
            variant: variant,
            onTap: dismissSnackBar,
          ),
        ),
        // ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // 애니메이션 시작
    animationController.forward();

    // 3초 후에 역방향 애니메이션 실행 후 제거
    Future.delayed(waitDuration).then((_) {
      if (!isDismissed) {
        dismissSnackBar();
      }
    });
  }

  const YHSnackBar({
    super.key,
    required this.message,
    required this.animation,
    this.variant = SnackBarVariant.defaults,
    this.onTap,
  });

  final String message;
  final Animation<double> animation;
  final SnackBarVariant variant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 100 * (1 - animation.value)), // 100픽셀 위로 이동
          child: SafeArea(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: keyboardHeight > 0 ? keyboardHeight + 16 : 16,
                  top: 16,
                ),
                decoration: BoxDecoration(
                  color: YHColor.textWhite,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.16),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (variant != SnackBarVariant.defaults) ...[
                      _getIcon(variant),
                      const SizedBox(width: 4),
                    ],
                    const SizedBox(width: 4),
                    YHText(
                      text: message,
                      font: YHFont.regular16,
                      color: YHColor.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getIcon(SnackBarVariant variant) {
    switch (variant) {
      case SnackBarVariant.success:
        return YHImage.icon_check_circle_fill_216
            .icon(width: 20, height: 20, color: YHColor.iconAccentGreen);
      case SnackBarVariant.warning:
        return YHImage.icon_info_circle_fill_216
            .icon(width: 20, height: 20, color: YHColor.iconAccentYellow);
      case SnackBarVariant.error:
        return YHImage.icon_warning_triangle_fill_216
            .icon(width: 20, height: 20, color: YHColor.iconAccentRed);
      default:
        return const SizedBox.shrink();
    }
  }
}
