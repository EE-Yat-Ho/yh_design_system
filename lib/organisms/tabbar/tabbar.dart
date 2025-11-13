import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/organisms/tabbar/tab.dart';

// 20251108. TabController랑 TickerProviderStateMixin가 Bloc에서 쓰기 까다로움..
// 때문에, 컨트롤러를 내부에 둔 채로, 외부에서 인덱스도 조절할 수 있도록 약간 복잡하게 구현.
final class YHTabbar extends StatefulWidget {
  const YHTabbar({
    super.key,
    // index
    this.initIndex = 0,
    this.dynamicIndex, // 외부에서 값 넣어주면 이걸로 인덱스 세팅.
    // text
    required this.texts,
    this.font = YHFont.regular16,
    // layout
    this.isScrollable = false,
    this.height = 40,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.indicatorSize = TabBarIndicatorSize.label,
    this.tabAlignment,
    // Color
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorColor,
    this.dividerColor,
    // red dot
    this.redIndex = const [],
    // call back
    required this.onTap,
  });

  final int initIndex;
  final int? dynamicIndex; // 외부에서 값 넣어주면 이걸로 인덱스 세팅.
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
  final List<int> redIndex;

  @override
  YHTabbarState createState() => YHTabbarState();
}

final class YHTabbarState extends State<YHTabbar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.texts.length, vsync: this);
    _tabController.index = widget.dynamicIndex ?? widget.initIndex;
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

    // dynamicIndex가 있고, 현재와 다른경우 TabController 인덱스 변경
    if (widget.dynamicIndex != null &&
        widget.dynamicIndex != _tabController.index) {
      _tabController.index = widget.dynamicIndex!;
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
      color: widget.backgroundColor,
      child: TabBar(
        controller: _tabController,
        isScrollable: widget.isScrollable,
        tabAlignment: widget.tabAlignment,
        padding: widget.padding,
        labelPadding: widget.labelPadding,
        tabs: widget.texts
            .asMap()
            .entries
            .map(
              (entry) => YHTab(
                height: widget.height,
                redDot: widget.redIndex.contains(entry.key),
                text: entry.value,
                color: _tabController.index == entry.key
                    ? widget.selectedColor ?? YHColor.primary
                    : widget.unselectedColor ?? YHColor.textSub,
                font: widget.font,
              ),
            )
            .toList(),
        dividerColor: widget.dividerColor ?? YHColor.strokeStrong,
        indicatorSize: widget.indicatorSize,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: widget.indicatorColor ?? YHColor.primary, width: 2)),
        onTap: widget.onTap,
      ),
    );
  }
}
