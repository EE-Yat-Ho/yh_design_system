import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/column/column.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_util/entities/yh_user.dart';

// 로그인 방법 선택 팝업
// iOS 일때 애플 로그인 버튼 제공
Future<YHUser?> showLoginMethodDialog(
  BuildContext context, {
  required Future<YHUser?> Function() onGoogleLogin,
  required Future<YHUser?> Function() onAppleLogin,
}) async {
  return showDialog<YHUser?>(
      context: context,
      builder: (BuildContext innerContext) {
        // 구글 로그인, 애플 로그인 버튼 제공
        return Dialog(
          backgroundColor: YHColor.surfaceDefault,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: YHColumn(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                YHImage.char_write.icon(
                  width: double.infinity,
                  height: 100,
                ),
                const SizedBox(height: 16),
                YHText(
                  text: "yh_design_system.dialog.login_method.title".tr(),
                  font: YHFont.regular16,
                  color: YHColor.textDefault,
                  maxLines: 15,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 32),
                YHButton(
                  cornerRadius: 22,
                  borderColor: YHColor.primary,
                  borderWidth: 1,
                  leftWidget: YHImage.icon_google_216.icon(),
                  spacing: 4,
                  text: YHText(
                      text: "yh_design_system.dialog.login_method.google".tr(),
                      font: YHFont.regular16,
                      color: YHColor.gray900), // 배경이 무조건 하얀색이므로 검은색
                  height: 44,
                  width: double.infinity,
                  backgroundColor: YHColor.white,
                  onTap: () async {
                    final result = await onGoogleLogin();
                    if (context.mounted) {
                      Navigator.pop(context, result);
                    }
                  },
                ),
                if (Platform.isIOS) ...[
                  const SizedBox(height: 8),
                  YHButton(
                    cornerRadius: 22,
                    backgroundColor: YHColor.black,
                    leftWidget:
                        YHImage.icon_apple_216.icon(color: YHColor.white),
                    spacing: 4,
                    text: YHText(
                        text: "yh_design_system.dialog.login_method.apple".tr(),
                        font: YHFont.regular16,
                        color: YHColor.white),
                    height: 44,
                    width: double.infinity,
                    onTap: () async {
                      final result = await onAppleLogin();
                      if (context.mounted) {
                        Navigator.pop(context, result);
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      });
}
