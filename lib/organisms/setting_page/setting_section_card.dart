import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/organisms/setting_page/setting_list.dart';

final class SettingSectionCard extends StatelessWidget {
  const SettingSectionCard({super.key, required this.section});

  final SettingSection section;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");
    var text = YHText(
        text: section.title,
        font: YHFont.regular16,
        color: YHColor.textDefault);

    return ListTile(
      dense: true,
      leading: text,
      contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    );
  }
}
