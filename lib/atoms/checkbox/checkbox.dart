import "package:flutter/material.dart";
import "package:yh_design_system/atoms/color/colors.dart";

final class YHCheckbox extends StatefulWidget {
  const YHCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tapTargetSize = 24.0,
    this.checkboxSize = 16.5,
    this.checkIconSize = 12.0,
    this.checkColor = YHColor.white,
    this.activeColor,
    this.borderColor = YHColor.textDisabled,
    this.borderRadius = 2.0,
    this.borderWidth = 1.5,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final bool value;
  final void Function(bool) onChanged;
  final double tapTargetSize;
  final double checkboxSize;
  final double checkIconSize;
  final Color checkColor;
  final Color? activeColor;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final Duration animationDuration;

  @override
  State<YHCheckbox> createState() => _YHCheckboxState();
}

final class _YHCheckboxState extends State<YHCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _checkAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    final activeColor = widget.activeColor ?? YHColor.primary;

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _checkAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: activeColor,
    ).animate(_checkAnimation);

    _borderColorAnimation = ColorTween(
      begin: widget.borderColor,
      end: activeColor,
    ).animate(_checkAnimation);

    if (widget.value) {
      _animationController.value = 1.0; // 즉시 완료 상태로 설정
    }
  }

  @override
  void didUpdateWidget(YHCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    final activeColor = widget.activeColor ?? YHColor.primary;

    if (widget.value != oldWidget.value) {
      if (widget.value) {
        // 애니메이션 재생
        _animationController.forward();
      } else {
        // 애니메이션 되감기
        _animationController.reverse();
      }
    }

    // 색상 애니메이션 업데이트
    if (widget.activeColor != oldWidget.activeColor ||
        widget.borderColor != oldWidget.borderColor) {
      _colorAnimation = ColorTween(
        begin: Colors.transparent,
        end: activeColor,
      ).animate(_checkAnimation);

      _borderColorAnimation = ColorTween(
        begin: widget.borderColor,
        end: activeColor,
      ).animate(_checkAnimation);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: SizedBox(
        width: widget.tapTargetSize,
        height: widget.tapTargetSize,
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: widget.checkboxSize,
                height: widget.checkboxSize,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _borderColorAnimation.value ?? widget.borderColor,
                    width: widget.borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: _colorAnimation.value ?? Colors.transparent,
                ),
                child: CustomPaint(
                  painter: _CheckMarkPainter(
                    progress: _checkAnimation,
                    color: widget.checkColor,
                  ),
                  size: Size(widget.checkIconSize, widget.checkIconSize),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

final class _CheckMarkPainter extends CustomPainter {
  const _CheckMarkPainter({
    required this.progress,
    required this.color,
  });

  final Animation<double> progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final checkPath = Path();

    // 체크 마크 경로 생성 (상대적 좌표)
    final double width = size.width;
    final double height = size.height;

    checkPath.moveTo(width * 0.2, height * 0.5);
    checkPath.lineTo(width * 0.45, height * 0.7);
    checkPath.lineTo(width * 0.8, height * 0.3);

    // 진행도에 따라 경로를 부분적으로 그리기
    final pathMetrics = checkPath.computeMetrics();
    for (final metric in pathMetrics) {
      final extractedPath = metric.extractPath(
        0.0,
        metric.length * progress.value,
      );
      path.addPath(extractedPath, Offset.zero);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CheckMarkPainter oldDelegate) =>
      oldDelegate.progress.value != progress.value ||
      oldDelegate.color != color;
}
