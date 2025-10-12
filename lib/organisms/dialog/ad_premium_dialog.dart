import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showAdPremiumDialog(
  BuildContext context, {
  required void Function() onConfirm,
  required void Function() onCancel,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
            buttonDirection: ButtonDirection.vertical,
            image: YHImage.char_really,
            text: "yh_design_system.dialog.ad_premium.title".tr(),
            confirmText: "yh_design_system.dialog.ad_premium.confirmText".tr(),
            onConfirm: onConfirm,
            cancelText: "yh_design_system.dialog.ad_premium.cancelText".tr(),
            onCancel: onCancel);
      });
}
