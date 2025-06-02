import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showLoginFailureDialog(
    BuildContext context, dynamic exception) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          text: "로그인에 실패했어요.\n$exception",
          onConfirm: () {},
        );
      });
}
