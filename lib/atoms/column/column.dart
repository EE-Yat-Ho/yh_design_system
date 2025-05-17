import 'package:flutter/material.dart';

class YHColumn extends StatelessWidget {
  const YHColumn({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    required this.children,
    this.padding,
    this.spacing = 0,
  });

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget> children;
  final EdgeInsets? padding;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final column = Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      spacing: spacing,
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
