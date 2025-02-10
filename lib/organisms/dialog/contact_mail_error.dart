import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_design_system/organisms/dialog/dialog.dart';
import 'package:yh_design_system/atoms/image/images.dart';

Future<dynamic> showContactMailErrorDialog(
  BuildContext context, {
  String? text,
  YHImage? image,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext innerContext) {
        return YHDialog(
          image: image ?? YHImage.char_really,
          text: text ??
              "기본 메일앱 사용에 실패하여 직접 문의를 전송하기 어려운 상황입니다.\n\n아래 메일로 문의주시면 친절히 답변해 드리겠습니다! :)\n\nyhlabs.team@gmail.com",
          onConfirm: () {
            Clipboard.setData(
                const ClipboardData(text: "yhlabs.team@gmail.com"));
          },
          confirmText: "메일 복사",
          cancelText: "확인",
        );
      });
}
