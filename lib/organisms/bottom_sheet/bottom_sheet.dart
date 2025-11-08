import 'package:flutter/material.dart';
import 'package:yh_design_system/organisms/background/paper_background.dart';

Future<dynamic> showYHBottomSheet(
  BuildContext context, {
  required Widget child,
  double? fixHeight, // 고정 높이 300
  double? percentageHeight, // 화면대비 높이 0.8
}) async {
  double? height;
  if (fixHeight != null) {
    height = fixHeight;
  } else if (percentageHeight != null) {
    height = MediaQuery.of(context).size.height * percentageHeight;
  }
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) => YHPaperBackground(
      child: Container(
        height: height,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: child,
      ),
    ),
  );
}
