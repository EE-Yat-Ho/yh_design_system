import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';
import 'package:yh_util/local_notification.dart';

Future<dynamic> showRestartDialog(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false, // 배경 눌러도 안꺼지게
      builder: (_) {
        return PopScope(
            canPop: false,
            child: YHDialog(
                text: "개선사항을 적용할 준비가 되었어요! 앱을 재시작 해주세요.",
                confirmText: "앱 종료",
                onConfirm: () async {
                  await showLocalNotification(
                      1, "개선사항 반영 완료", "앱을 다시 시작하기 위해 눌러주세요!");
                  exit(0);
                }));
      });
}
