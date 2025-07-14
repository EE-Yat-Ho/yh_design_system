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
    this.backgroundColor = YHColor.white,
    this.selectedColor = YHColor.contentPrimary,
    this.unselectedColor = YHColor.contentSecondary,
    this.indicatorColor = YHColor.contentPrimary,
    this.dividerColor = YHColor.outline,
    this.indicatorSize = TabBarIndicatorSize.label,
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
  final YHColor backgroundColor;
  final YHColor selectedColor;
  final YHColor unselectedColor;
  final YHColor indicatorColor;
  final YHColor dividerColor;
  final TabBarIndicatorSize indicatorSize;

  @override
  YHTabbarState createState() => YHTabbarState();
}

final class YHTabbarState extends State<YHTabbar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.texts.length, vsync: this);
    _tabController.index = widget.initIndex;
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor.color,
      child: TabBar(
        controller: _tabController,
        isScrollable: widget.isScrollable,
        tabAlignment: TabAlignment.start,
        padding: widget.padding,
        labelPadding: widget.labelPadding,
        tabs: widget.texts
            .asMap()
            .entries
            .map((entry) => YHTab(
                  height: widget.height,
                  text: entry.value,
                  color: _tabController.index == entry.key
                      ? widget.selectedColor
                      : widget.unselectedColor,
                  font: widget.font,
                ))
            .toList(),
        indicatorColor: widget.indicatorColor.color,
        dividerColor: widget.dividerColor.color,
        indicatorSize: widget.indicatorSize,
        indicator: UnderlineTabIndicator(
            borderSide:
                BorderSide(color: widget.indicatorColor.color, width: 2)),
        onTap: widget.onTap,
      ),
    );
  }
}
