import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showSuggestLoginDialog(
  BuildContext context,
  void Function() onConfirm,
  void Function() onCancel,
) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          image: YHImage.char_question_mark,
          buttonDirection: ButtonDirection.vertical,
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          text: "yh_design_system.dialog.suggest_login.title".tr(),
          titleAlign: TextAlign.center,
          onConfirm: () => onConfirm(),
          confirmText: "yh_design_system.dialog.suggest_login.confirm".tr(),
          onCancel: () => onCancel(),
          cancelText: "yh_design_system.dialog.suggest_login.cancel".tr(),
        );
      });
}
