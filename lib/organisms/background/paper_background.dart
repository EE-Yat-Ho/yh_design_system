import 'package:flutter/material.dart';
import 'package:yh_design_system/utils/theme.dart';

final class YHPaperBackground extends StatelessWidget {
  const YHPaperBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: YHTheme.isDarkMode
                ? const AssetImage('assets/images/image_paper_dark.png')
                : const AssetImage(
                    'assets/images/image_paper_light.png'), // 배경 이미지
          ),
        ),
        child: child);
  }
}
