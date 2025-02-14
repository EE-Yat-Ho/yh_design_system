import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

// 참고 피그마
// https://www.figma.com/design/AeeQXpjCKW6bPwfpWIFhLi/%5BRelease%5D-%ED%83%80%EC%9A%B4-%EA%B4%80%EB%A6%AC%EC%9E%90-Mobile?node-id=2820-19653&t=cEo6ipDQEPQtfGSJ-0

final class YHProgressBar extends StatelessWidget {
  const YHProgressBar({
    super.key,
    this.progressCount = 1,
    this.totalCount = 2,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  final int progressCount;
  final int totalCount;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 12,
      color: Colors.transparent,
      padding: padding,
      alignment: Alignment.center,
      child: Row(
        spacing: 8,
        children: List.generate(
          totalCount,
          (index) => _item(index < progressCount),
        ),
      ),
    );
  }

  Widget _item(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? YHColor.primary.color : YHColor.dividerWeak.color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
