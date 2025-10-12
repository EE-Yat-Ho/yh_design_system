import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/organisms/dialog/text_field_dialog.dart';

Future<dynamic> showTTSTestDialog(
    BuildContext context, void Function(String? message) onConfirm) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHTextFieldDialog(
          onConfirm: (message) => onConfirm(message),
          titleWidget: Row(children: [
            YHText(
              text: "yh_design_system.dialog.tts_test.title".tr(),
              font: YHFont.regular18,
              color: YHColor.textDefault,
            ),
            const SizedBox(width: 4),
            YHImage.icon_speaker_96.icon(width: 18, height: 18),
          ]),
          hintText: "yh_design_system.dialog.tts_test.hint".tr(),
        );
      });
}
