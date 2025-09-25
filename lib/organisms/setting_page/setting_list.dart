import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/setting_page/setting_cell_card.dart';
import 'package:yh_design_system/organisms/setting_page/setting_section_card.dart';
import 'package:yh_design_system/utils/yh_expansion_panel_list.dart';
import 'package:yh_design_system/atoms/image/images.dart';

final class SettingSection {
  final String title;
  final List<SettingCell> cells;

  SettingSection(this.title, this.cells);
}

final class SettingCell {
  final int id;
  final String title;
  final bool canTap;
  final YHImageInterface? leftImage;
  final String? leftEmoji;
  final String? rightText;
  final Future<String>? rightFutureText;
  final YHImageInterface? rightImage;

  SettingCell({
    required this.id,
    required this.title,
    this.canTap = true,
    this.leftImage,
    this.rightText,
    this.rightFutureText,
    this.leftEmoji,
    this.rightImage,
  });
}

final class SettingList extends StatelessWidget {
  const SettingList({
    super.key,
    required this.sections,
    required this.onTap,
    this.padding,
  });

  final void Function(int id) onTap;
  final List<SettingSection> sections;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: YHExpansionPanelList(
        elevation: 0,
        children: sections.map<AppExpansionPanel>((SettingSection section) {
          return AppExpansionPanel(
            backgroundColor: Colors.transparent,
            isExpanded: true,
            headerBuilder: (_, __) => SettingSectionCard(section: section),
            body: Column(
              children: section.cells
                  .map((e) => SettingCellCard(cell: e, onTap: onTap))
                  .toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
