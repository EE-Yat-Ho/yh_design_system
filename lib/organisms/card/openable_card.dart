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
    // 레이아웃
    this.dense = false,
    this.margin = const EdgeInsets.only(bottom: 4),
    this.contentPadding = const EdgeInsets.fromLTRB(12, 0, 12, 0),
    this.cornerRadius = 20,
    this.horizontalTitleGap = 10,
    this.isSelected = false,
    // 보여줄지 여부들
    this.showAddButton = true,
    this.showArrow = true,
    // 그림자
    this.shadowColor,
    this.shadowSpreadRadius = 1,
    this.shadowBlurRadius = 2,
    this.shadowOffset = const Offset(0, 2),
    // 이벤트
    required this.onTap,
    this.onLongPress,
    this.onTapAddButton,
  });

  final OpenableObject object;
  // 레이아웃
  final bool dense;
  final bool isSelected;
  final EdgeInsets margin;
  final double cornerRadius;
  final double horizontalTitleGap;
  final EdgeInsets contentPadding;
  // 보여줄지 여부들
  final bool showAddButton;
  final bool showArrow;
  // 그림자
  final Color? shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  // 이벤트
  final void Function(String id) onTap;
  final void Function(String id)? onLongPress;
  final void Function(String id)? onTapAddButton;
  @override
  Widget build(BuildContext context) {
    List<Widget> mainRowList = [
      YHText(
        text: object.rightText ?? "", // bag.numberOfNote.toString(),
        font: YHFont.regular16,
        color: YHColor.textSub,
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
        dense: dense,
        leading: object.leadingImage.icon(width: 26, height: 26),
        title: YHText(
          text: object.text,
          font: YHFont.regular18,
          color: YHColor.black,
        ),
        onTap: () => onTap(object.id),
        onLongPress: () => onLongPress?.call(object.id),
        horizontalTitleGap: horizontalTitleGap,
        contentPadding: contentPadding,
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
          rightWidget: const Icon(
            Icons.add,
            color: YHColor.iconWhite,
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
