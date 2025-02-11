import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/organisms/card/card.dart';

class HorizontalImageCollection extends StatelessWidget {
  final List<String> imageUrls;
  final double itemHeight;
  final double itemWidth;
  final EdgeInsets contentInsets;
  final double spacing;
  final Function(int)? onTap;
  final int selectedIndex;
  final bool showSelectedBorder;

  const HorizontalImageCollection(
      {super.key,
      required this.imageUrls,
      this.itemHeight = 120,
      this.itemWidth = 120,
      this.spacing = 8,
      this.contentInsets = const EdgeInsets.symmetric(horizontal: 24),
      this.onTap,
      this.selectedIndex = 0,
      this.showSelectedBorder = false});

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
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
              width: itemWidth,
              height: itemHeight,
            ),
          );
        },
      ),
    );
  }
}
