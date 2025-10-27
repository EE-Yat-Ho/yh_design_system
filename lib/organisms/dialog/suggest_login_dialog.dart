import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<bool> showSuggestLoginDialog(
  BuildContext context,
) async {
  return await showDialog<bool>(
          context: context,
          builder: (BuildContext innerContext) {
            return YHDialog(
              image: YHImage.char_really,
              buttonDirection: ButtonDirection.vertical,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              text: "yh_design_system.dialog.suggest_login.title".tr(),
              titleAlign: TextAlign.center,
              onConfirm: () => Navigator.pop(innerContext, true),
              confirmText: "yh_design_system.dialog.suggest_login.confirm".tr(),
              onCancel: () => Navigator.pop(innerContext, false),
              cancelText: "yh_design_system.dialog.suggest_login.cancel".tr(),
            );
          }) ??
      false;
}
