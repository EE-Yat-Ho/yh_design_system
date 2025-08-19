import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showLoginFailureDialog(
    BuildContext context, dynamic exception) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          text:
              'component.dialog.login_failure'.tr(args: [exception.toString()]),
          onConfirm: () {},
        );
      });
}
