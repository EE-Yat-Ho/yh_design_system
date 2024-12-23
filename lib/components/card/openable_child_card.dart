import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/components/card/card.dart';
import 'package:yh_design_system/components/list/openable_list.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHOpenableChildCard extends StatelessWidget {
  const YHOpenableChildCard(
      {super.key,
      required this.object,
      required this.onTap,
      this.onLongPress,
      this.isSelected = false,
      this.margin,
      this.showRightArrow = true});

  final ChildObject object;
  final void Function(int id) onTap;
  final void Function(int id)? onLongPress;
  final bool isSelected;
  final EdgeInsets? margin;
  final bool showRightArrow;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      ListTile(
        dense: true,
        leading: object.leadingImage.icon(width: 22, height: 22),
        title: YHText(
          text: object.text,
          font: YHFont.body3,
          color: YHColor.black,
          maxLines: 2,
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        trailing: trailing(context),
        onTap: () => onTap(object.id),
        onLongPress: () {
          if (onLongPress != null) {
            onLongPress!(object.id);
          }
        },
      ),
    ];

    if (isSelected) {
      list.add(
        Row(children: [
          Container(
            width: 12,
          ),
          YHImage.icon_check_red.icon(width: 40, height: 40)
        ]),
      );
    }

    return YHCard(margin: margin, child: Stack(children: list));
  }

  Widget trailing(BuildContext context) {
    List<Widget> list = [
      YHText(
        text: object.rightText ?? "", // "Q ${note.numberOfQuestion}",
        font: YHFont.body3,
        color: YHColor.gray,
      ),
      const SizedBox(
        width: 6,
      ),
      // YHText(
      //   text: "M ${note.numberOfMemo}",
      //   font: YHFont.body3,
      //   color: YHColor.gray,
      // ),
      // SizedBox(
      //   width: 6,
      // ),
    ];

    if (showRightArrow) {
      list.add(
        YHImage.icon_right.icon(width: 24, height: 24),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
