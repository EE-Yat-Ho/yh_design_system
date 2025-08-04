import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/organisms/dialog/text_field_dialog.dart';

Future<dynamic> showTesterLoginDialog(
    BuildContext context, void Function(String? value) onConfirm) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHTextFieldDialog(
          onConfirm: onConfirm,
          title: 'dialog.tester_login.title'.tr(),
          hintText: 'dialog.tester_login.hint'.tr(),
        );
      });
}
