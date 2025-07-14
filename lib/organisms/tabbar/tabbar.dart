import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/organisms/tabbar/tab.dart';

final class YHTabbar extends StatefulWidget {
  const YHTabbar({
    super.key,
    required this.initIndex,
    required this.texts,
    this.height = 40,
    this.font = YHFont.regular16,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.isScrollable = false,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor = YHColor.contentSecondary,
    this.indicatorColor,
    this.dividerColor = YHColor.outline,
    this.indicatorSize = TabBarIndicatorSize.label,
    this.tabAlignment,
    required this.onTap,
  });

  final int initIndex;
  final ValueChanged<int>? onTap;
  final List<String> texts;
  final double height;
  final YHFont font;
  final EdgeInsets padding;
  final EdgeInsets labelPadding;
  final bool isScrollable;
  final YHColor? backgroundColor;
  final YHColor? selectedColor;
  final YHColor unselectedColor;
  final YHColor? indicatorColor;
  final YHColor dividerColor;
  final TabBarIndicatorSize indicatorSize;
  final TabAlignment? tabAlignment;

  @override
  YHTabbarState createState() => YHTabbarState();
}

final class YHTabbarState extends State<YHTabbar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.texts.length, vsync: this);
    _tabController.index = widget.initIndex;
    super.initState();
  }

  @override
  void didUpdateWidget(YHTabbar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 탭 개수가 변경된 경우 TabController 재생성
    if (oldWidget.texts.length != widget.texts.length) {
      final oldIndex = _tabController.index;
      _tabController.dispose();
      _tabController = TabController(length: widget.texts.length, vsync: this);

      // 기존 인덱스가 새로운 탭 범위 내에 있으면 유지, 그렇지 않으면 0으로 설정
      _tabController.index = oldIndex < widget.texts.length ? oldIndex : 0;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor?.color,
      child: TabBar(
        controller: _tabController,
        isScrollable: widget.isScrollable,
        tabAlignment: widget.tabAlignment,
        padding: widget.padding,
        labelPadding: widget.labelPadding,
        tabs: widget.texts
            .asMap()
            .entries
            .map((entry) => YHTab(
                  height: widget.height,
                  text: entry.value,
                  color: _tabController.index == entry.key
                      ? widget.selectedColor ?? YHColor.primary
                      : widget.unselectedColor,
                  font: widget.font,
                ))
            .toList(),
        dividerColor: widget.dividerColor.color,
        indicatorSize: widget.indicatorSize,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: widget.indicatorColor?.color ?? YHColor.primary.color,
                width: 2)),
        onTap: widget.onTap,
      ),
    );
  }
}
