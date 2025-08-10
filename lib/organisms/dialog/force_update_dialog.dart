import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';
import 'package:yh_util/url_launch.dart';

// 강제 업데이트 팝업 (앱 버전 체크)
// appStoreId: 앱스토어 id (iOS 용)
// packageName: 패키지 이름 (안드로이드 용)
Future<dynamic> showForceUpdateDialog(
  BuildContext context, {
  required String appStoreId,
  required String packageName,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: false, // 배경 눌러도 안꺼지게
      builder: (BuildContext innerContext) {
        return PopScope(
            canPop: false, // 뒤로가기 물리버튼 방지
            child: YHDialog(
              text: 'yh_design_system.dialog.force_update.message'.tr(),
              onConfirm: () async {
                await moveToStore(appStoreId, packageName);
                exit(0);
              },
              confirmText:
                  'yh_design_system.dialog.force_update.go_to_store'.tr(),
            ));
      });
}
