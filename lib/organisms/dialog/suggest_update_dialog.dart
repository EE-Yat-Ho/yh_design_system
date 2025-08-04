import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
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
          text: 'dialog.suggest_update.message'.tr(),
          onConfirm: () async => await moveToStore(appStoreId, packageName),
          confirmText: 'dialog.suggest_update.go_to_store'.tr(),
          cancelText: 'dialog.suggest_update.later'.tr(),
        );
      });
}
