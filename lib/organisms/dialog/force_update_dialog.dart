import 'dart:io';

import 'package:flutter/material.dart';
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
              text: "죄송해요, 앱 사용에 꼭 필요한 업데이트가 있어요!",
              onConfirm: () async {
                await moveToStore(appStoreId, packageName);
                exit(0);
              },
              confirmText: "스토어로 이동",
            ));
      });
}
