import 'package:flutter/material.dart';

final class YHColumn extends StatelessWidget {
  const YHColumn({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.padding,
    this.spacing = 0,
    this.textDirection,
    required this.children,
  });

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsets? padding;
  final double spacing;
  final TextDirection? textDirection;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final column = Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      spacing: spacing,
      textDirection: textDirection,
      children: children,
    );
    if (padding != null) {
      return Padding(
        padding: padding!,
        child: column,
      );
    }
    return column;
  }
}
