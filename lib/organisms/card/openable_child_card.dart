import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
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
  final bool isSelect;
  final bool isBookmark;
  final String? rightText;
  final ImageEntity? rightImage;

  const ChildObject({
    required this.object,
    required this.id,
    required this.leadingImage,
    required this.text,
    required this.isSelect,
    required this.isBookmark,
    this.rightText,
    this.rightImage,
  });
}

final class YHOpenableChildCard extends StatelessWidget {
  const YHOpenableChildCard({
    super.key,
    required this.object,
    // 레이아웃
    this.dense = true,
    this.margin = const EdgeInsets.fromLTRB(12, 0, 12, 4),
    this.contentPadding = const EdgeInsets.fromLTRB(16, 0, 12, 0),
    this.cornerRadius = 20,
    this.horizontalTitleGap = 12,
    this.minTileHeight = 40,
    // 보여줄지 여부들
    this.showSelectCheck = true,
    this.showBookmark = true,
    this.showRightArrow = true,
    // 그림자
    this.shadowColor,
    this.shadowSpreadRadius = 1,
    this.shadowBlurRadius = 2,
    this.shadowOffset = const Offset(0, 2),
    // 이벤트
    required this.onTap,
    this.onLongPress,
    this.onBookmarkTap,
  });

  final ChildObject object;
  // 레이아웃
  final bool dense;
  final double cornerRadius;
  final double minTileHeight;
  final double horizontalTitleGap;
  final EdgeInsets margin;
  final EdgeInsets contentPadding;
  // 보여줄지 여부들
  final bool showSelectCheck;
  final bool showBookmark;
  final bool showRightArrow;
  // 그림자
  final Color? shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  // 이벤트
  final void Function(String id) onTap;
  final void Function(String id)? onLongPress;
  final void Function(String id)? onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      ListTile(
        dense: dense,
        leading: object.leadingImage.icon(width: 22, height: 22),
        title: YHText(
          text: object.text,
          font: YHFont.regular16,
          color: YHColor.black,
          maxLines: 2,
        ),
        horizontalTitleGap: horizontalTitleGap,
        contentPadding: contentPadding,
        trailing: trailing(context),
        onTap: () => onTap(object.id),
        onLongPress: () => onLongPress?.call(object.id),
        minTileHeight: 40,
      ),
    ];

    if (showSelectCheck && object.isSelect) {
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
          child: Image.file(
            object.rightImage!.file,
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              debugPrint(
                  "🚨🏞️ 이미지 표시 실패 error: $error, stackTrace: $stackTrace");
              // 이미지 표시 실패 시 대체 이미지
              return YHImage.icon_photo_48.iconWithOff(width: 20, height: 20);
            },
          ),
        )
      ]);
    }

    if (showBookmark) {
      list.addAll([
        const SizedBox(width: 4),
        YHInkWell(
          padding: const EdgeInsets.all(4),
          cornerRadius: 4,
          onTap: () => onBookmarkTap?.call(object.id),
          child: object.isBookmark
              ? YHImage.icon_bookmark_on_48.icon(width: 20, height: 20)
              : YHImage.icon_bookmark_off_48.icon(width: 20, height: 20),
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
