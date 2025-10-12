import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';
import 'package:yh_design_system/atoms/image/images.dart';

Future<dynamic> showContactMailErrorDialog(
  BuildContext context, {
  String? text,
  YHImageInterface? image,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          image: image,
          text:
              text ?? 'yh_design_system.dialog.contact_mail.error_message'.tr(),
          subText: 'common.developer_email'.tr(),
          onConfirm: () {
            Clipboard.setData(
                ClipboardData(text: 'common.developer_email'.tr()));
          },
          confirmText: 'yh_design_system.dialog.contact_mail.copy_mail'.tr(),
          cancelText: 'common.confirm'.tr(),
        );
      });
}
