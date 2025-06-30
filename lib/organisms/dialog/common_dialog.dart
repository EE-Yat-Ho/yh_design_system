import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showYHDialog(
  BuildContext context, {
  String? title,
  String? message,
}) async {
  return showDialog(
    context: context,
    builder: (context) => YHDialog(
      text: title ?? "",
      subText: message ?? "",
      onConfirm: () {},
    ),
  );
}
