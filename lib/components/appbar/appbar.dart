import 'package:flutter/material.dart';
import 'package:yh_design_system/colors.dart';
import 'package:yh_design_system/components/text/text.dart';
import 'package:yh_design_system/fonts.dart';

class YHAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;

  YHAppBar({
    this.icon,
    this.title = '',
    this.menuItem,
    this.height = kToolbarHeight,
    this.hideBack = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: menuItem,
      toolbarHeight: preferredSize.height,
      leading: hideBack
          ? Container()
          : icon == null
              ? BackButton()
              : IconButton(
                  icon: Image.asset(
                    icon!,
                    height: 18,
                    width: 18,
                  ),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
      title: YHText(
        text: title ?? '',
        font: YHFont.regular18,
        color: YHColor.primary,
      ),
      backgroundColor: Colors.transparent,
      foregroundColor: YHColor.primary.color,
      centerTitle: true,
    );
  }
}
