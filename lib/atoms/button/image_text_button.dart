import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/image/images.dart';

class YHImageTextButton extends StatelessWidget {
  const YHImageTextButton({
    super.key,
    required this.text,
    this.iconData,
    this.image,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius,
    this.minHeight,
    this.minWidth,
    required this.onTap,
  });

  final VoidCallback? onTap;
  final YHText text;
  final IconData? iconData;
  final YHImageInterface? image;
  final YHColor? textColor;
  final YHColor? borderColor;
  final double? borderWidth;
  final double? cornerRadius;
  final double? minHeight;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    OutlinedBorder? shape;
    if (borderColor != null && borderWidth != null) {
      shape = RoundedRectangleBorder(
        side: BorderSide(color: borderColor!.color, width: borderWidth!),
        borderRadius: BorderRadius.circular(cornerRadius ?? 0),
      );
    }
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          shape: shape,
          minimumSize: Size(minWidth ?? 0, minHeight ?? 0),
          maximumSize: Size(minWidth ?? 0, minHeight ?? 0),
          padding: const EdgeInsets.all(5),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: child());
  }

  Widget child() {
    List<Widget> list = [];

    Widget? imageWidget;
    if (image != null) {
      imageWidget = image!.icon(width: 24, height: 24);
    } else if (iconData != null) {
      imageWidget = Icon(iconData);
    }
    if (imageWidget != null) {
      list.add(Row(
        children: [
          const SizedBox(width: 14),
          Center(child: imageWidget),
          const Spacer()
        ],
      ));
    }
    list.add(Center(child: text));

    // return Row(children: list);

    return Stack(
      children: list,
    );
  }
}
