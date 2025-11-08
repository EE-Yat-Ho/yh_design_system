import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/organisms/tabbar/tab.dart';

/// 외부에서 TabController를 통해 완전히 제어되는 탭바 컴포넌트
/// TabController는 반드시 외부에서 생성하여 전달해야 합니다.
final class YHTabbar extends StatelessWidget {
  const YHTabbar({
    super.key,
    required this.controller,
    required this.texts,
    this.height = 40,
    this.font = YHFont.regular16,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.isScrollable = false,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorColor,
    this.dividerColor,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.tabAlignment,
    this.onTap,
  });

  /// 외부에서 생성한 TabController
  /// 이를 통해 탭 인덱스를 완전히 제어할 수 있습니다.
  final TabController controller;

  final ValueChanged<int>? onTap;
  final List<String> texts;
  final double height;
  final YHFont font;
  final EdgeInsets padding;
  final EdgeInsets labelPadding;
  final bool isScrollable;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? indicatorColor;
  final Color? dividerColor;
  final TabBarIndicatorSize indicatorSize;
  final TabAlignment? tabAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: TabBar(
        controller: controller,
        isScrollable: isScrollable,
        tabAlignment: tabAlignment,
        padding: padding,
        labelPadding: labelPadding,
        tabs: texts
            .asMap()
            .entries
            .map((entry) => YHTab(
                  height: height,
                  text: entry.value,
                  color: controller.index == entry.key
                      ? selectedColor ?? YHColor.primary
                      : unselectedColor ?? YHColor.textSub,
                  font: font,
                ))
            .toList(),
        dividerColor: dividerColor ?? YHColor.strokeStrong,
        indicatorSize: indicatorSize,
        indicator: UnderlineTabIndicator(
            borderSide:
                BorderSide(color: indicatorColor ?? YHColor.primary, width: 2)),
        onTap: onTap,
      ),
    );
  }
}
