import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showErrorDialog(BuildContext context, Object exception) async {
  return showDialog(
      context: context,
      builder: (_) {
        return YHDialog(text: exception.toString(), onConfirm: () {});
      });
}
