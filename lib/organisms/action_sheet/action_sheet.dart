import 'package:flutter/cupertino.dart';

final class ActionSheetAction {
  ActionSheetAction(
      {required this.id,
      required this.title,
      required this.onTap,
      required this.isDestructive,
      required this.isDefault});

  final String id;
  final String title;
  final void Function(String id) onTap;
  final bool isDestructive;
  final bool isDefault;
}

void showActionSheet(BuildContext context, List<ActionSheetAction> actions) {
  List<CupertinoActionSheetAction> cupertinoActions = actions.map((e) {
    return CupertinoActionSheetAction(
      isDefaultAction: e.isDefault,
      isDestructiveAction: e.isDestructive,
      onPressed: () {
        Navigator.pop(context);
        e.onTap(e.id);
      },
      child: Text(e.title),
    );
  }).toList();

  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
            actions: cupertinoActions,
          ));
}
