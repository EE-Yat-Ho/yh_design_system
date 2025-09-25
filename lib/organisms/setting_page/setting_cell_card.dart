import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/organisms/setting_page/setting_list.dart';

class SettingCellCard extends StatelessWidget {
  const SettingCellCard({
    super.key,
    required this.cell,
    required this.onTap,
  });

  final SettingCell cell;
  final void Function(int id) onTap;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");
    List<Widget> rightRowChildren = [];

    if (cell.rightImage != null) {
      rightRowChildren
          .insertAll(0, [cell.rightImage!.icon(width: 24, height: 24)]);
    }

    if (cell.rightText != null) {
      rightRowChildren.insertAll(0, [
        YHText(
          text: "${cell.rightText}",
          font: YHFont.regular16,
          color: YHColor.textSub,
        ),
        const SizedBox(width: 6),
      ]);
    }

    if (cell.rightFutureText != null) {
      rightRowChildren.insertAll(0, [
        FutureBuilder(
          future: cell.rightFutureText!,
          builder: (context, snapshot) {
            return YHText(
              text: snapshot.data ?? "",
              font: YHFont.regular16,
              color: YHColor.textSub,
            );
          },
        ),
      ]);
    }

    Widget? leftWidget;
    if (cell.leftImage != null) {
      leftWidget = SizedBox(
          width: 24,
          height: 24,
          child: cell.leftImage!.icon(width: 24, height: 24));
    } else if (cell.leftEmoji != null) {
      leftWidget = SizedBox(
          width: 24,
          child: YHText(
              text: cell.leftEmoji ?? "",
              font: YHFont.regular24,
              color: YHColor.textDefault));
    }

    List<Widget> list = [
      ListTile(
        dense: true,
        leading: leftWidget,
        title: YHText(
          text: cell.title,
          font: YHFont.regular16,
          color: YHColor.textDefault,
          maxLines: 2,
        ),
        contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: rightRowChildren,
        ),
        onTap: cell.canTap ? () => onTap(cell.id) : null,
      ),
    ];

    return YHCard(
      cornerRadius: 8,
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 8),
      useShadow: cell.canTap,
      borderColor: cell.canTap ? null : YHColor.strokeDefault,
      borderWidth: cell.canTap ? 0 : 1,
      child: Stack(children: list),
    );
  }
}
