import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/card/openable_child_card.dart';
import 'package:yh_design_system/organisms/card/openable_card.dart';
import 'super_list_models.dart';
import 'super_list_animation_manager.dart';

final class SuperListItemBuilder {
  final SuperListAnimationManager animationManager;
  final void Function(String openableId, bool isExpand) onTapOpenable;
  final void Function(String openableId)? onLongPressOpenable;
  final void Function(String openableId)? onTapAddButton;
  final void Function(String openableId, String childId) onTapChild;
  final void Function(String openableId, String childId)? onLongPressChild;
  final void Function(String openableId, String childId)? onBookmarkTap;
  final bool showSelected;
  final bool showBookmark;
  final bool showAddButton;
  final bool showOpenableArrow;
  final bool showChildArrow;
  final double openableCardCornerRadius;
  final double childCardCornerRadius;
  final EdgeInsets openableCardMargin;
  final EdgeInsets childCardMargin;

  SuperListItemBuilder({
    required this.animationManager,
    required this.onTapOpenable,
    required this.onTapChild,
    this.onLongPressOpenable,
    this.onTapAddButton,
    this.onLongPressChild,
    this.onBookmarkTap,
    required this.showSelected,
    required this.showBookmark,
    required this.showAddButton,
    required this.showOpenableArrow,
    required this.showChildArrow,
    required this.openableCardCornerRadius,
    required this.childCardCornerRadius,
    required this.openableCardMargin,
    required this.childCardMargin,
  });

  Widget buildListItem(SuperListItem item, int index) {
    switch (item.type) {
      case SuperListItemType.openable:
        return _buildOpenableItem(item);
      case SuperListItemType.child:
        return _buildChildItem(item);
    }
  }

  Widget _buildOpenableItem(SuperListItem item) {
    final openable = item.object as OpenableObject;
    return YHOpenableCard(
      key: ValueKey('${item.type.name}_${item.id}'),
      object: openable,
      onTap: (id) => onTapOpenable(id, !openable.isOpened),
      onLongPress: (id) => onLongPressOpenable?.call(id),
      onTapAddButton: (id) => onTapAddButton?.call(id),
      isSelected: showSelected &&
          openable.children.every((o) => o.isSelect) &&
          openable.children.isNotEmpty,
      margin: openableCardMargin,
      showAddButton: showAddButton,
      showArrow: showOpenableArrow,
      cornerRadius: openableCardCornerRadius,
    );
  }

  Widget _buildChildItem(SuperListItem item) {
    final child = item.object as ChildObject;
    final fadeAnimation = animationManager.getFadeAnimation(item.parentId!);

    final childCard = YHOpenableChildCard(
      key: ValueKey('${item.type.name}_${item.id}'),
      object: child,
      margin: childCardMargin,
      cornerRadius: childCardCornerRadius,
      // 보여줄지 여부
      showSelectCheck: showSelected,
      showBookmark: showBookmark,
      showRightArrow: showChildArrow,
      // 핸들러
      onTap: (childId) => onTapChild(item.parentId!, childId),
      onLongPress: (childId) => onLongPressChild?.call(item.parentId!, childId),
      onBookmarkTap: (childId) => onBookmarkTap?.call(item.parentId!, childId),
    );

    if (fadeAnimation == null) {
      return childCard;
    }

    return AnimatedBuilder(
      key: ValueKey('${item.type.name}_${item.id}'),
      animation: Listenable.merge([fadeAnimation]),
      builder: (context, child) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: childCard,
        );
      },
    );
  }

  Widget buildDragHandleItem(SuperListItem item, int index) {
    return Container(
      key: ValueKey('${item.type.name}_${item.id}'),
      child: Row(
        children: [
          Expanded(child: buildListItem(item, index)),
          ReorderableDragStartListener(
            index: index,
            child: SizedBox(
              width: 40,
              height: 24,
              child: YHImage.icon_hamburger_72.icon(
                width: 24,
                height: 24,
                color: YHColor.textSub,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
