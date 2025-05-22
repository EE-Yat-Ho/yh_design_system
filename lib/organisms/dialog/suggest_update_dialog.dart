import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';
import 'package:yh_util/url_launch.dart';

// 업데이트 제안 팝업 (앱 버전 체크)
// appStoreId: 앱스토어 id (iOS 용)
// packageName: 패키지 이름 (안드로이드 용)
Future<dynamic> showSuggestUpdateDialog(
  BuildContext context, {
  required String appStoreId,
  required String packageName,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          text: "새로운 업데이트가 있어요! 업데이트 하실래요?",
          onConfirm: () => moveToStore(appStoreId, packageName),
          confirmText: "스토어로 이동",
          cancelText: "다음에",
        );
      });
}
