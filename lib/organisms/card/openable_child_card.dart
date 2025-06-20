import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_util/image_entity.dart';

final class ChildObject {
  final Object object;
  final String id;
  final YHImageInterface leadingImage;
  final String text;
  final String? rightText;
  final bool isSelect;

  ChildObject(this.object, this.id, this.leadingImage, this.text,
      this.rightText, this.isSelect);
}

final class YHOpenableChildCard extends StatelessWidget {
  const YHOpenableChildCard({
    super.key,
    required this.object,
    required this.onTap,
    this.onLongPress,
    this.isSelected = false,
    this.margin = const EdgeInsets.fromLTRB(12, 0, 12, 4),
    this.showRightArrow = true,
    this.elevation = 0,
    this.cornerRadius = 20,
    this.minTileHeight = 40,
    this.image,
  });

  final ChildObject object;
  final void Function(String id) onTap;
  final void Function(String id)? onLongPress;
  final bool isSelected;
  final EdgeInsets margin;
  final bool showRightArrow;
  final double cornerRadius;
  final double elevation;
  final double minTileHeight;
  final ImageEntity? image;

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
        onLongPress: () => onLongPress?.call(object.id),
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
        text: object.rightText ?? "",
        font: YHFont.regular16,
        color: YHColor.gray,
      ),
      const SizedBox(width: 6),
    ];

    if (showRightArrow) {
      list.add(YHImage.icon_right_216.icon(width: 24, height: 24));
    }

    if (image != null) {
      list.add(Image.file(image!.file, width: 24, height: 24));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
