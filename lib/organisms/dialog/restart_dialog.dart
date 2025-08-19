import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';
import 'package:yh_util/local_notification.dart';

// shorebird 강제 업데이트
Future<dynamic> showRestartDialog(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false, // 배경 눌러도 안꺼지게
      builder: (_) {
        return PopScope(
            canPop: false, // 뒤로가기 물리버튼 방지
            child: YHDialog(
                text: 'component.dialog.restart.message'.tr(),
                confirmText: 'component.dialog.restart.exit_app'.tr(),
                onConfirm: () async {
                  await showLocalNotification(
                      1,
                      'component.dialog.restart.notification_title'.tr(),
                      'component.dialog.restart.notification_body'.tr());
                  exit(0);
                }));
      });
}
