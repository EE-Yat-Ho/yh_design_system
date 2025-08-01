import "package:flutter/material.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/font/fonts.dart";

final class YHSegmentControl extends StatefulWidget {
  const YHSegmentControl({
    super.key,
    required this.segments,
    required this.selectedIndex,
    required this.onSegmentSelected,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  final List<String> segments;
  final int selectedIndex;
  final void Function(int) onSegmentSelected;
  final Duration animationDuration;

  @override
  State<YHSegmentControl> createState() => _YHSegmentControlState();
}

final class _YHSegmentControlState extends State<YHSegmentControl>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _slideAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(YHSegmentControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _animationController.forward(from: 0.0);
    }
    if (widget.animationDuration != oldWidget.animationDuration) {
      _animationController.duration = widget.animationDuration;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final segmentWidth =
              (constraints.maxWidth - 8) / widget.segments.length; // 8은 padding

          return Container(
            decoration: BoxDecoration(
              color: YHColor.surface02.color,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(4),
            child: Stack(
              children: [
                // 슬라이딩하는 선택 표시자
                AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    final currentPosition = widget.selectedIndex * segmentWidth;

                    return AnimatedPositioned(
                      duration: widget.animationDuration,
                      curve: Curves.easeInOut,
                      left: currentPosition,
                      top: 0,
                      child: Container(
                        width: segmentWidth,
                        height: 40, // 세그먼트 높이와 맞춤
                        decoration: BoxDecoration(
                          color: YHColor.white.color,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: YHColor.outline.color),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(25),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // 세그먼트 텍스트들
                Row(
                  children: widget.segments.asMap().entries.map((entry) {
                    final index = entry.key;
                    final segment = entry.value;
                    final isSelected = widget.selectedIndex == index;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () => widget.onSegmentSelected(index),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: widget.animationDuration,
                              curve: Curves.easeInOut,
                              style: TextStyle(
                                color: isSelected
                                    ? YHColor.contentPrimary.color
                                    : YHColor.contentSecondary.color,
                                fontSize: YHFont.regular14.fontSize,
                                fontWeight: YHFont.regular14.fontWeight,
                                fontFamily: YHFont.fontFamily.name,
                              ),
                              child: Text(
                                segment,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
