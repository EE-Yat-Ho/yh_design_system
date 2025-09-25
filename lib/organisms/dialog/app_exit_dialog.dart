import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showAppExitDialog(
    BuildContext context, void Function() onConfirm) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          image: YHImage.char_question_mark,
          buttonDirection: ButtonDirection.vertical,
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          text: "component.dialog.app_exit.title".tr(),
          titleAlign: TextAlign.center,
          onConfirm: onConfirm,
          confirmText: "component.dialog.app_exit.confirmText".tr(),
          cancelText: "component.dialog.app_exit.cancelText".tr(),
        );
      });
}
