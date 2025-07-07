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
  final ImageEntity? rightImage;

  ChildObject(this.object, this.id, this.leadingImage, this.text,
      this.rightText, this.isSelect, this.rightImage);
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
    this.cornerRadius = 20,
    this.minTileHeight = 40,
    this.shadowColor,
    this.shadowSpreadRadius = 1,
    this.shadowBlurRadius = 2,
    this.shadowOffset = const Offset(0, 2),
  });

  final ChildObject object;
  final void Function(String id) onTap;
  final void Function(String id)? onLongPress;
  final bool isSelected;
  final EdgeInsets margin;
  final bool showRightArrow;
  final double cornerRadius;
  final double minTileHeight;
  final Color? shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
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
      shadowColor: shadowColor,
      shadowSpreadRadius: shadowSpreadRadius,
      shadowBlurRadius: shadowBlurRadius,
      shadowOffset: shadowOffset,
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
    ];

    if (object.rightImage != null) {
      list.addAll([
        const SizedBox(width: 4),
        YHCard(
          borderWidth: 1,
          borderColor: YHColor.gray90,
          backgroundColor: YHColor.transparent,
          cornerRadius: 4,
          useShadow: false,
          child: Image.file(object.rightImage!.file, width: 24, height: 24),
        )
      ]);
    }

    if (showRightArrow) {
      list.addAll([
        const SizedBox(width: 4),
        YHImage.icon_right_216.icon(width: 24, height: 24)
      ]);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}
