import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/organisms/collection/openable_list.dart';
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
      this.margin = EdgeInsets.zero,
      this.showRightArrow = true,
      this.elevation = 0,
      this.cornerRadius = 20,
      this.minTileHeight = 40});

  final ChildObject object;
  final void Function(String id) onTap;
  final void Function(String id)? onLongPress;
  final bool isSelected;
  final EdgeInsets margin;
  final bool showRightArrow;
  final double cornerRadius;
  final double elevation;
  final double minTileHeight;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      ListTile(
        dense: true,
        leading: object.leadingImage.icon(width: 22, height: 22),
        title: YHText(
          text: object.text,
          font: YHFont.regular16,
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
        minTileHeight: 40,
      ),
    ];

    if (isSelected) {
      list.add(
        Row(children: [
          Container(width: 12),
          YHImage.icon_check_red_130.icon(width: 40, height: 40)
        ]),
      );
    }

    return YHCard(
      cornerRadius: cornerRadius,
      margin: margin,
      elevation: elevation,
      child: Stack(children: list),
    );
  }

  Widget trailing(BuildContext context) {
    List<Widget> list = [
      YHText(
        text: object.rightText ?? "", // "Q ${note.numberOfQuestion}",
        font: YHFont.regular16,
        color: YHColor.gray,
      ),
      const SizedBox(width: 6),
      // YHText(
      //   text: "M ${note.numberOfMemo}",
      //   font: YHFont.regular16,
      //   color: YHColor.gray,
      // ),
      // SizedBox(
      //   width: 6,
      // ),
    ];

    if (showRightArrow) {
      list.add(
        YHImage.icon_right_144.icon(width: 24, height: 24),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
