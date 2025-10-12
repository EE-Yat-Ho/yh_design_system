import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showThankYouDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          onConfirm: () {},
          titleAlign: TextAlign.center,
          buttonDirection: ButtonDirection.vertical,
          text: "yh_design_system.dialog.thank_you.title".tr(),
          subText: "yh_design_system.dialog.thank_you.subText".tr(),
          image: YHImage.char_write,
        );
      });
}
