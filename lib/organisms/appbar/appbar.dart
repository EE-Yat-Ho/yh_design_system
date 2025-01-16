import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

// class YHAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? icon;
//   final String? title;
//   final double? height;
//   final List<Widget>? menuItem;
//   final bool hideBack;

//   const YHAppBar({
//     super.key,
//     this.icon,
//     this.title = '',
//     this.menuItem,
//     this.height = kToolbarHeight,
//     this.hideBack = false,
//   });

//   @override
//   Size get preferredSize => Size.fromHeight(height!);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       actions: menuItem,
//       toolbarHeight: preferredSize.height,
//       leading: hideBack
//           ? Container()
//           : icon == null
//               ? const BackButton()
//               : IconButton(
//                   icon: Image.asset(
//                     icon!,
//                     height: 18,
//                     width: 18,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                   },
//                 ),
//       title: YHText(
//         text: title ?? '',
//         font: YHFont.body2,
//         color: YHColor.primary,
//       ),
//       backgroundColor: Colors.transparent,
//       foregroundColor: YHColor.primary.color,
//       centerTitle: true,
//     );
//   }
// }

class YHAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBack;
  final Widget? left;
  final double leftPadding;
  final Widget? right;
  final double? rightPadding;
  final double? height;
  final Color backgroundColor;
  final void Function()? backButtonOnTap;

  const YHAppBar({
    super.key,
    this.title,
    this.showBack = true,
    this.left,
    this.leftPadding = 8,
    this.right,
    this.rightPadding,
    this.height = kToolbarHeight,
    this.backgroundColor = Colors.transparent,
    this.backButtonOnTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;
    if (title != null && title!.isNotEmpty) {
      titleWidget = YHText(
        text: title!,
        font: YHFont.body3,
        color: YHColor.contentPrimary,
      );
    }

    return AppBar(
      actions: [
        if (right != null) right!,
        if (rightPadding != null) SizedBox(width: rightPadding!),
      ],
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      leading: Row(children: [
        SizedBox(width: leftPadding),
        if (showBack) _backButton(context),
        if (left != null) left!,
      ]),
      leadingWidth: titleWidget == null ? double.infinity : null,
      title: titleWidget,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.black,
      centerTitle: true,
    );
  }

  Widget _backButton(BuildContext context) {
    return YHButton(
      onPressed: backButtonOnTap != null
          ? backButtonOnTap!
          : () => Navigator.pop(context),
      image: Image.asset("images/back_button_icon.png",
          width: 24, height: 24, fit: BoxFit.fitHeight),
      width: 40,
      height: 40,
      backgroundColor: YHColor.opacity,
      shadow: false,
    );
  }
}
