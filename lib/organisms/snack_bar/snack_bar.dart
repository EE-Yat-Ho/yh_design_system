import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';

class YHSnackBar extends StatelessWidget {
  const YHSnackBar({
    super.key,
    required this.message,
    required this.animation,
  });

  final String message;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 100 * (1 - animation.value)), // 100픽셀 위로 이동
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: YHColor.contentPrimary.color,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.16),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: YHText(
                text: message,
                font: YHFont.regular12,
                color: YHColor.contentTertiary,
              ),
            ),
          ),
        );
      },
    );
  }

  // 토스트를 보여주는 함수
  static void show(BuildContext context, String message) {
    OverlayEntry? overlayEntry;

    // 애니메이션 컨트롤러 생성
    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    );

    // 페이드인/아웃과 슬라이드를 위한 커브드 애니메이션
    final animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: YHSnackBar(
            message: message,
            animation: animation,
          ),
        ),
        // ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    // 애니메이션 시작
    animationController.forward();

    // 1.5초 후에 역방향 애니메이션 실행 후 제거
    Future.delayed(const Duration(milliseconds: 4000)).then((_) {
      animationController.reverse().then((_) {
        overlayEntry?.remove();
        animationController.dispose();
      });
    });
  }
}
