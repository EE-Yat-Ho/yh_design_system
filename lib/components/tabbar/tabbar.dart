import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';

class YHTabbar extends StatefulWidget {
  const YHTabbar({
    super.key,
    required this.initIndex,
    required this.tabs,
    required this.onTap,
  });

  final int initIndex;
  final ValueChanged<int>? onTap;
  final List<Widget> tabs;

  @override
  _YHTabbarState createState() => _YHTabbarState();
}

class _YHTabbarState extends State<YHTabbar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    _tabController.index = widget.initIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: widget.tabs,
      labelColor: YHColor.primary.color,
      indicatorColor: YHColor.primary.color,
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: widget.onTap,
    );
  }
}
