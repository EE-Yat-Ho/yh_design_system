import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showErrorDialog(
  BuildContext context,
  Object exception,
  VoidCallback onConfirm,
) async {
  return showDialog(
      context: context,
      builder: (_) {
        return YHDialog(
          text: 'yh_design_system.dialog.error.title'.tr(),
          subText: exception.toString(),
          confirmText: 'yh_design_system.dialog.error.confirm'.tr(),
          onConfirm: onConfirm,
        );
      });
}
