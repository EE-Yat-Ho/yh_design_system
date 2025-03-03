import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/organisms/collection/openable_list.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHOpenableCard extends StatelessWidget {
  const YHOpenableCard({
    super.key,
    required this.object,
    this.isSelected = false,
    this.showAddButton = true,
    this.showArrow = true,
    this.onTap,
    this.onTapAddButton,
  });

  final OpenableObject object;
  final bool isSelected;
  final bool showAddButton;
  final bool showArrow;
  final void Function(int id)? onTap;
  final void Function(int id)? onTapAddButton;

  @override
  Widget build(BuildContext context) {
    List<Widget> mainRowList = [
      YHText(
        text: object.rightText ?? "", // bag.numberOfNote.toString(),
        font: YHFont.regular16,
        color: YHColor.gray,
      ),
      const SizedBox(
        width: 8,
      ),
    ];

    if (showArrow) {
      mainRowList.add(object.isOpened
          ? YHImage.icon_down.icon()
          : YHImage.icon_left.icon());
    }

    List<Widget> stackList = [
      ListTile(
        leading: object.leadingImage.icon(width: 26, height: 26),
        title: YHText(
          text: object.text,
          font: YHFont.regular18,
          color: YHColor.black,
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: mainRowList,
        ),
      ),
    ];

    if (showAddButton) {
      mainRowList.insertAll(2, [
        YHButton(
          width: 24,
          height: 24,
          onTap: () {
            if (onTapAddButton != null) {
              onTapAddButton!(object.id);
            }
          },
          rightWidget: Icon(
            Icons.add,
            color: YHColor.white.color,
            size: 18,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ]);
    }

    if (isSelected) {
      stackList.add(
        Row(children: [
          Container(width: 12),
          YHImage.icon_check_red.icon(width: 40, height: 40)
        ]),
      );
    }

    return YHCard(
      child: Stack(children: stackList),
    );
  }
}
