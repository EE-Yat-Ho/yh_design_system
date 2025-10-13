import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/organisms/card/openable_card.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

import 'super_list_models.dart';
import 'super_list_animation_manager.dart';
import 'super_list_item_builder.dart';
import 'super_list_drag_handler.dart';

// 새로운 슈퍼 리스트

// 모든 아이템을 하나의 리스트로 관리
// 펼치기 기능
// 펼칠 때 애니메이션
// 순서 바꾸기 기능

final class SuperList extends StatefulWidget {
  const SuperList({
    super.key,
    required this.objects,
    // 레이아웃
    required this.emptyText,
    this.showSelected = true,
    this.showBookmark = true,
    this.showAddButton = true,
    this.showChild = true,
    this.showOpenableArrow = true,
    this.showChildArrow = true,
    this.openableCardElevation = 2,
    this.childCardElevation = 2,
    this.openableCardCornerRadius = 10,
    this.childCardCornerRadius = 10,
    this.listPadding = const EdgeInsets.fromLTRB(16, 8, 16, 100),
    this.openableCardMargin = const EdgeInsets.fromLTRB(0, 4, 0, 8),
    this.childCardMargin = const EdgeInsets.fromLTRB(12, 0, 12, 4),
    this.withFlexable = true,
    // 핸들러
    required this.onTapOpenable,
    required this.onTapChild,
    this.onLongPressOpenable,
    this.onLongPressChild,
    this.onTapAddButton,
    this.onReorderOpenable,
    this.onReorderChild,
    this.onBookmarkTap,
    // 기능
    this.canDragAndDrop = false,
    this.canDragOpenable = true,
    this.canDragChild = true,
    this.childCanChangeOpenable = true,
  });

  final List<OpenableObject> objects;
  final String emptyText;
  // 열 수 있는 셀 클릭
  final void Function(String openableId, bool isExpand) onTapOpenable;
  final void Function(String openableId)? onLongPressOpenable;
  final void Function(String openableId)? onTapAddButton;
  // 열 수 없는 셀 클릭
  final void Function(String openableId, String childId) onTapChild;
  final void Function(String openableId, String childId)? onLongPressChild;
  final void Function(String openableId, String childId)? onBookmarkTap;

  // Openable 순서 변경 콜백
  // target 아래순서로 바꾸면됨

  // source: 옮겨진 아이템
  // target: 새로운 위치 위에 있는 아이템. null일 경우, 맨 위로 옮겨진 것.
  final void Function(String sourceId, String? targetId)? onReorderOpenable;

  // Child 순서 변경 콜백
  // target 바로 아래순서로 바꾸면됨

  // source: 옮겨진 아이템
  // targetOpenable: 새로운 위치 위에 있는 openable 아이템. null일 경우, 맨 위로 옮겨진 것
  // targetChild: 새로운 위치 위에 있는 child 아이템. null일 경우, Openable안에서 제일 위로 옮겨진 것
  final void Function(
    String sourceOpenableId,
    String sourceChildId,
    String targetOpenableId,
    String? targetChildId,
  )? onReorderChild;

  final double openableCardElevation;
  final double childCardElevation;
  final bool showSelected;
  final bool showBookmark;
  final bool showAddButton;
  final bool showChild;
  final bool showOpenableArrow;
  final bool showChildArrow;
  final double openableCardCornerRadius;
  final double childCardCornerRadius;
  final EdgeInsets listPadding;
  final EdgeInsets openableCardMargin;
  final EdgeInsets childCardMargin;
  final bool canDragAndDrop;
  final bool canDragOpenable;
  final bool canDragChild;
  final bool withFlexable;
  // 자식카드가 다른 부모로 이동 가능 여부
  final bool childCanChangeOpenable;

  @override
  State<SuperList> createState() => _SuperListState();
}

final class _SuperListState extends State<SuperList>
    with TickerProviderStateMixin {
  late SuperListAnimationManager _animationManager;
  late SuperListItemBuilder _itemBuilder;
  late SuperListDragHandler _dragHandler;
  List<SuperListItem> _currentFlattenedItems = [];

  @override
  void initState() {
    super.initState();
    _animationManager = SuperListAnimationManager(tickerProvider: this);
    _animationManager.initializeAnimations(widget.objects);
    _createItemBuilder();
    _createDragHandler();
  }

  @override
  void didUpdateWidget(SuperList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationManager.updateAnimations(widget.objects);
    // 설정값 바뀔 수 있으므로 다시 생성
    _createItemBuilder();
    _createDragHandler();
  }

  @override
  void dispose() {
    _animationManager.dispose();
    super.dispose();
  }

  void _createItemBuilder() {
    _itemBuilder = SuperListItemBuilder(
      animationManager: _animationManager,
      onTapOpenable: widget.onTapOpenable,
      onTapChild: widget.onTapChild,
      onLongPressOpenable: widget.onLongPressOpenable,
      onTapAddButton: widget.onTapAddButton,
      onLongPressChild: widget.onLongPressChild,
      onBookmarkTap: widget.onBookmarkTap,
      showSelected: widget.showSelected,
      showBookmark: widget.showBookmark,
      showAddButton: widget.showAddButton,
      showOpenableArrow: widget.showOpenableArrow,
      showChildArrow: widget.showChildArrow,
      openableCardCornerRadius: widget.openableCardCornerRadius,
      childCardCornerRadius: widget.childCardCornerRadius,
      openableCardMargin: widget.openableCardMargin,
      childCardMargin: widget.childCardMargin,
    );
  }

  void _createDragHandler() {
    _dragHandler = SuperListDragHandler(
      onReorderOpenable: widget.onReorderOpenable,
      onReorderChild: widget.onReorderChild,
      childCanChangeOpenable: widget.childCanChangeOpenable,
    );
  }

  List<SuperListItem> _buildFlattenedList() {
    final flattenedItems = <SuperListItem>[];

    for (final openable in widget.objects) {
      // openable 아이템 추가
      flattenedItems.add(SuperListItem(
        id: openable.id,
        type: SuperListItemType.openable,
        object: openable,
        level: 0,
      ));

      // openable이 열려있고 child를 보여주는 설정이 true인 경우 child 아이템들 추가
      if (widget.showChild && openable.isOpened) {
        for (final child in openable.children) {
          flattenedItems.add(SuperListItem(
            id: child.id,
            type: SuperListItemType.child,
            object: child,
            parentId: openable.id,
            level: 1,
          ));
        }
      }
    }

    return flattenedItems;
  }

  void _handleReorder(int oldIndex, int newIndex) {
    _dragHandler.handleReorder(_currentFlattenedItems, oldIndex, newIndex);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.objects.isEmpty) {
      return Expanded(
        child: Center(
          child: YHText(
            text: widget.emptyText,
            font: YHFont.bold18,
            color: YHColor.textDefault,
          ),
        ),
      );
    }

    final flattenedItems = _buildFlattenedList();
    _currentFlattenedItems = flattenedItems;

    final builder = widget.canDragAndDrop
        ? ReorderableListView.builder(
            padding: widget.listPadding,
            itemCount: flattenedItems.length,
            onReorder: _handleReorder,
            buildDefaultDragHandles: false, // 기본 핸들 비활성화
            itemBuilder: (context, index) {
              final item = flattenedItems[index];
              if (item.type == SuperListItemType.openable &&
                  widget.canDragOpenable) {
                return _itemBuilder.buildDragHandleItem(item, index);
              } else if (item.type == SuperListItemType.child &&
                  widget.canDragChild) {
                return _itemBuilder.buildDragHandleItem(item, index);
              }
              return _itemBuilder.buildListItem(item, index);
            },
          )
        : ListView.builder(
            padding: widget.listPadding,
            itemCount: flattenedItems.length,
            itemBuilder: (context, index) {
              final item = flattenedItems[index];
              return _itemBuilder.buildListItem(item, index);
            },
          );

    if (widget.withFlexable) {
      return Flexible(child: builder);
    }

    return builder;
  }
}
