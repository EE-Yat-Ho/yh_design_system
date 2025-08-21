import 'package:flutter/cupertino.dart';

void showActionSheet(BuildContext context, List<YHActionSheetAction> actions) {
  List<CupertinoActionSheetAction> cupertinoActions = actions.map((e) {
    return CupertinoActionSheetAction(
      isDefaultAction: e.isDefault,
      isDestructiveAction: e.isDestructive,
      onPressed: () {
        Navigator.pop(context);
        e.onTap(e.id);
      },
      child: e.title != null ? Text(e.title!) : e.customWidget!,
    );
  }).toList();

  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: cupertinoActions,
    ),
  );
}

final class YHActionSheetAction {
  YHActionSheetAction(
      {required this.id,
      this.title,
      this.customWidget,
      required this.onTap,
      required this.isDestructive,
      required this.isDefault});

  final String id;
  final String? title;
  final Widget? customWidget;
  final void Function(String id) onTap;
  final bool isDestructive;
  final bool isDefault;
}
