import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_util/entities/image_entity.dart';

final class HorizontalImageCollection extends StatelessWidget {
  final List<ImageEntity> images;
  final double itemHeight;
  final double itemWidth;
  final EdgeInsets contentInsets;
  final double spacing;
  final int selectedIndex;
  final bool showSelectedBorder;
  final Function(int)? onTap;
  final Function(int)? onDelete;
  final double dim;
  static const double borderWidth = 2;

  const HorizontalImageCollection({
    super.key,
    required this.images,
    this.itemHeight = 120,
    this.itemWidth = 120,
    this.spacing = 8,
    this.contentInsets = const EdgeInsets.symmetric(horizontal: 24),
    this.selectedIndex = 0,
    this.showSelectedBorder = true,
    this.onTap,
    this.onDelete,
    this.dim = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight + (showSelectedBorder ? borderWidth * 2 : 0), // 컬렉션 높이
      child: ListView.builder(
        padding: contentInsets,
        scrollDirection: Axis.horizontal, // 가로 스크롤 설정
        itemCount: images.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          final showBorder = showSelectedBorder && isSelected;
          final isLast = index == images.length - 1;

          return YHCard(
            width: itemWidth,
            height: itemHeight,
            cornerRadius: 8,
            borderColor: YHColor.primary,
            borderWidth: showBorder ? borderWidth : 0,
            margin: EdgeInsets.only(right: isLast ? 0 : spacing),
            onTap: () => onTap?.call(index),
            useShadow: false,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                _image(images[index], index, showBorder),
                if (dim > 0) _dim(showBorder),
                if (onDelete != null) _deleteButton(index),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _image(ImageEntity image, int index, bool showBorder) {
    return Image.file(
      image.file,
      fit: image.fit,
      width: itemWidth,
      height: itemHeight,
      errorBuilder: (context, error, stackTrace) {
        debugPrint("🚨🏞️ 이미지 표시 실패 error: $error, stackTrace: $stackTrace");
        // 이미지 표시 실패 시 대체 이미지
        return SizedBox(
          width: itemWidth,
          height: itemHeight,
          child: YHImage.icon_photo_48.iconWithOff(),
        );
      },
    );
  }

  Widget _dim(bool showBorder) {
    return Container(
      width: itemWidth,
      height: itemHeight,
      color: Colors.black.withValues(alpha: dim),
    );
  }

  Widget _deleteButton(int index) {
    return YHButton(
      padding: const EdgeInsets.all(8),
      backgroundColor: YHColor.transparent,
      onTap: () => onDelete?.call(index),
      image: YHImage.icon_close_24.icon(color: YHColor.white),
    );
  }
}
