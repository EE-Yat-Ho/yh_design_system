import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showAdidTrackDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          buttonDirection: ButtonDirection.vertical,
          image: YHImage.char_write,
          text: "yh_design_system.dialog.adid_track.title".tr(),
          subText: "yh_design_system.dialog.adid_track.subText".tr(),
          confirmText: "yh_design_system.dialog.adid_track.confirmText".tr(),
          onConfirm: () {},
        );
      });
}
