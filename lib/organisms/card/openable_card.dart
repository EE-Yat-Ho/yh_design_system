import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/organisms/card/openable_child_card.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';

final class OpenableObject {
  final Object object;
  final List<ChildObject> children;
  final String id;
  final YHImageInterface leadingImage;
  final String text;
  final String? rightText;
  final bool isOpened;

  const OpenableObject({
    required this.object,
    required this.children,
    required this.id,
    required this.leadingImage,
    required this.text,
    this.rightText,
    required this.isOpened,
  });
}

final class YHOpenableCard extends StatelessWidget {
  const YHOpenableCard({
    super.key,
    required this.object,
    required this.onTap,
    this.onLongPress,
    this.isSelected = false,
    this.margin = const EdgeInsets.only(bottom: 4),
    this.showAddButton = true,
    this.showArrow = true,
    this.onTapAddButton,
    this.cornerRadius = 20,
    this.shadowColor,
    this.shadowSpreadRadius = 1,
    this.shadowBlurRadius = 2,
    this.shadowOffset = const Offset(0, 2),
  });

  final OpenableObject object;
  final bool isSelected;
  final EdgeInsets margin;
  final bool showAddButton;
  final bool showArrow;
  final Color? shadowColor;
  final double cornerRadius;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final void Function(String id) onTap;
  final void Function(String id)? onLongPress;
  final void Function(String id)? onTapAddButton;
  @override
  Widget build(BuildContext context) {
    List<Widget> mainRowList = [
      YHText(
        text: object.rightText ?? "", // bag.numberOfNote.toString(),
        font: YHFont.regular16,
        color: YHColor.gray,
      ),
      const SizedBox(width: 8),
    ];

    if (showArrow) {
      mainRowList.add(object.isOpened
          ? YHImage.icon_down_216.icon()
          : YHImage.icon_left_216.icon());
    }

    List<Widget> stackList = [
      ListTile(
        leading: object.leadingImage.icon(width: 26, height: 26),
        title: YHText(
          text: object.text,
          font: YHFont.regular18,
          color: YHColor.black,
        ),
        onTap: () => onTap(object.id),
        onLongPress: () => onLongPress?.call(object.id),
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
      child: Stack(children: stackList),
    );
  }
}
