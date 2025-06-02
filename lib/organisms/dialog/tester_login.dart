import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/text_field_dialog.dart';

Future<dynamic> showTesterLoginDialog(
    BuildContext context, void Function(String? value) onConfirm) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHTextFieldDialog(
          onConfirm: onConfirm,
          title: "테스터 로그인",
          hintText: "테스터 코드를 입력해주세요",
        );
      });
}
