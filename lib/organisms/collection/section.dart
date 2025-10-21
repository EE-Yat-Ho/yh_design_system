import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/organisms/collection/cell.dart';

final class YHSection {
  final String title;
  final List<YHCell> cells;

  YHSection(this.title, this.cells);
}

// 각종 리스트에서 사용할 섹션용 위젯
final class YHSectionWidget extends StatelessWidget {
  const YHSectionWidget({
    super.key,
    required this.section,
    this.font = YHFont.regular16,
    this.color,
    this.padding = const EdgeInsets.fromLTRB(4, 0, 4, 0),
  });

  final YHSection section;
  final YHFont font;
  final Color? color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");
    var text = YHText(
      text: section.title,
      font: font,
      color: color ?? YHColor.textDefault,
    );

    return ListTile(
      dense: true,
      leading: text,
      contentPadding: padding,
    );
  }
}
