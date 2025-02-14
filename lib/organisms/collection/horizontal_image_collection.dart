import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/organisms/card/card.dart';

class HorizontalImageCollection extends StatelessWidget {
  final List<String> imageUrls;
  final double itemHeight;
  final double itemWidth;
  final EdgeInsets contentInsets;
  final double spacing;
  final int selectedIndex;
  final bool showSelectedBorder;
  final bool isNetworkImage;
  final Function(int)? onTap;
  final Function(int)? onDelete;
  final double dim;

  const HorizontalImageCollection(
      {super.key,
      required this.imageUrls,
      this.itemHeight = 120,
      this.itemWidth = 120,
      this.spacing = 8,
      this.contentInsets = const EdgeInsets.symmetric(horizontal: 24),
      this.selectedIndex = 0,
      this.showSelectedBorder = false,
      this.isNetworkImage = true,
      this.onTap,
      this.onDelete,
      this.dim = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight, // 이미지 높이 설정
      child: ListView.builder(
        padding: contentInsets,
        scrollDirection: Axis.horizontal, // 가로 스크롤 설정
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          final borderColor = isSelected ? YHColor.primary : null;
          final borderWidth = isSelected ? 2.0 : 0.0;

          return YHCard(
            cornerRadius: 8,
            borderColor: showSelectedBorder ? borderColor : null,
            borderWidth: showSelectedBorder ? borderWidth : 0.0,
            margin: EdgeInsets.only(
                right: index == imageUrls.length - 1 ? 0 : spacing),
            onTap: () => onTap?.call(index),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                _image(imageUrls[index], index),
                if (dim > 0) _dim(),
                if (onDelete != null) _deleteButton(index),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _image(String imageUrl, int index) {
    return isNetworkImage
        ? Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
            width: itemWidth,
            height: itemHeight,
          )
        : Image.file(
            File(imageUrls[index]),
            fit: BoxFit.cover,
            width: itemWidth,
            height: itemHeight,
          );
  }

  Widget _deleteButton(int index) {
    return YHButton(
      padding: const EdgeInsets.all(8),
      backgroundColor: YHColor.transparent,
      onTap: () => onDelete?.call(index),
      image: Image.asset("assets/images/icon_close_line_24.png",
          width: 24,
          height: 24,
          fit: BoxFit.fitHeight,
          package: "yh_design_system"),
    );
  }

  Widget _dim() {
    return Container(
      width: itemWidth,
      height: itemHeight,
      color: Colors.black.withValues(alpha: dim),
    );
  }
}
