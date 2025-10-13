import 'super_list_models.dart';

final class SuperListDragHandler {
  final void Function(
    String sourceId,
    String? targetId,
  )? onReorderOpenable;

  final void Function(
    String sourceOpenableId,
    String sourceChildId,
    String targetOpenableId,
    String? targetChildId,
  )? onReorderChild;

  final bool childCanChangeOpenable;

  SuperListDragHandler({
    this.onReorderOpenable,
    this.onReorderChild,
    this.childCanChangeOpenable = true,
  });

  void handleReorder(
      List<SuperListItem> currentFlattenedItems, int oldIndex, int newIndex) {
    print("📐 SuperList oldIndex: $oldIndex, newIndex: $newIndex");

    if (oldIndex < 0 ||
        newIndex < 0 ||
        oldIndex >= currentFlattenedItems.length ||
        newIndex > currentFlattenedItems.length) {
      return;
    }

    final sourceItem = currentFlattenedItems[oldIndex]; // 옮겨진 아이템
    SuperListItem? targetItem =
        newIndex == 0 // 새로운 위치 위에 있는 아이템. null일 경우, 맨 위로 옮겨진 것
            ? null
            : currentFlattenedItems[newIndex - 1];

    bool isValid = true;
    if (sourceItem.type == SuperListItemType.openable) {
      isValid = _handleOpenableReorder(sourceItem, targetItem);
    } else if (sourceItem.type == SuperListItemType.child) {
      isValid = _handleChildReorder(sourceItem, targetItem);
    }

    // UI 빠른 업데이트용
    if (isValid) {
      currentFlattenedItems.removeAt(oldIndex);
      final insertIndex = newIndex > oldIndex ? newIndex - 1 : newIndex;
      currentFlattenedItems.insert(insertIndex, sourceItem);
    }
  }

  bool _handleOpenableReorder(
      SuperListItem sourceItem, SuperListItem? targetItem) {
    String? targetOpenableId;
    if (targetItem == null) {
      targetOpenableId = null;
    } else if (targetItem.type == SuperListItemType.openable) {
      targetOpenableId = targetItem.id;
    } else if (targetItem.type == SuperListItemType.child) {
      targetOpenableId = targetItem.parentId;
    }
    onReorderOpenable?.call(sourceItem.id, targetOpenableId);
    return true;
  }

  bool _handleChildReorder(
      SuperListItem sourceItem, SuperListItem? targetItem) {
    String? targetOpenableId;
    String? targetChildId;
    if (targetItem == null) {
      return false;
    } else if (targetItem.type == SuperListItemType.openable) {
      targetOpenableId = targetItem.id;
    } else if (targetItem.type == SuperListItemType.child) {
      targetOpenableId = targetItem.parentId;
      targetChildId = targetItem.id;
    }

    if (!childCanChangeOpenable && targetOpenableId != sourceItem.parentId) {
      return false;
    }

    onReorderChild?.call(
        sourceItem.parentId!, sourceItem.id, targetOpenableId!, targetChildId);
    return true;
  }
}
