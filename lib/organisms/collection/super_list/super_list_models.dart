enum SuperListItemType { openable, child }

final class SuperListItem {
  final String id;
  final SuperListItemType type;
  final String? parentId; // child인 경우 부모 openable의 id
  final dynamic object; // OpenableObject 또는 child object
  final int level; // 들여쓰기 레벨 (0: openable, 1: child)

  SuperListItem({
    required this.id,
    required this.type,
    required this.object,
    this.parentId,
    this.level = 0,
  });
}
