import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';

Future<dynamic> showLoginFailureDialog(
    BuildContext context, dynamic exception) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          text: 'yh_design_system.dialog.login_failure'
              .tr(args: [exception.toString()]),
          onConfirm: () {},
        );
      });
}

// 자동 로그인 시 인증 기간 만료(토큰 폐기·계정 비활성 등)로 로그아웃되었음을 안내.
Future<dynamic> showSessionExpiredDialog(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext innerContext) {
        return YHDialog(
          text: 'yh_design_system.dialog.session_expired'.tr(),
          onConfirm: () {},
        );
      });
}
