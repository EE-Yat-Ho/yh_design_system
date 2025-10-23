import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/image/images.dart';
import 'package:yh_design_system/atoms/decoration/yh_red_dot.dart';
import 'package:yh_design_system/atoms/switch/switch.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_util/common/theme.dart';

final class YHCell extends StatelessWidget {
  const YHCell({
    super.key,
    required this.id,
    // 왼쪽 아이콘
    this.leftImage,
    this.leftEmoji,
    // 타이틀
    this.titleWidget,
    this.title,
    this.titleFont = YHFont.regular16,
    this.titleColor,
    this.titleMaxLines = 2,
    // 서브타이틀
    this.subtitleWidget,
    this.subtitle,
    this.subtitleFont = YHFont.regular14,
    this.subtitleColor,
    this.subtitleMaxLines = 2,
    // 오른쪽
    this.showArrow = true,
    this.right,
    this.rightText,
    this.rightFutureText,
    this.rightTextFont = YHFont.regular16,
    this.rightTextColor,
    this.rightImage,
    this.initialToggleValue,
    // 레드닷
    this.redDot = false,
    this.redDotSize = 6,
    // 레이아웃
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 0),
    this.backgroundColor = YHColor.transparent,
    this.borderColor,
    this.borderWidth,
    this.cornerRadius,
    // 그림자
    this.useShadow,
    this.shadow,
    // 이벤트
    this.onTap,
    this.onToggle,
  });

  final int id;
  // 왼쪽 아이콘
  final YHImageInterface? leftImage;
  final String? leftEmoji;
  // 타이틀
  final Widget? titleWidget;
  final String? title;
  final YHFont titleFont;
  final Color? titleColor;
  final int titleMaxLines;
  // 서브타이틀
  final Widget? subtitleWidget;
  final String? subtitle;
  final YHFont subtitleFont;
  final Color? subtitleColor;
  final int subtitleMaxLines;
  // 오른쪽
  final bool showArrow;
  final Widget? right;
  final bool? initialToggleValue;
  final String? rightText;
  final Future<String>? rightFutureText;
  final YHImageInterface? rightImage;
  final YHFont rightTextFont;
  final Color? rightTextColor;
  // 레드닷
  final bool redDot;
  final double redDotSize;
  // 레이아웃
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? cornerRadius;
  // 그림자
  final bool? useShadow;
  final List<BoxShadow>? shadow;
  // 이벤트
  final void Function()? onTap;
  final void Function(bool)? onToggle;

  @override
  Widget build(BuildContext context) {
    debugPrint("🏗️ $this build");

    final canTap = onTap != null;

    return YHCard(
      cornerRadius: 8,
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 8),
      useShadow: useShadow ?? canTap,
      shadow: shadow,
      borderColor: borderColor ??
          (canTap
              ? null
              : YHTheme.isDarkMode
                  ? null
                  : YHColor.strokeDefault),
      borderWidth: borderWidth ?? (canTap ? 0 : 1),
      child: ListTile(
        dense: true,
        leading: _left(),
        title: _title(),
        subtitle: _subtitle(),
        contentPadding: contentPadding,
        trailing: _right(),
        onTap: onTap,
      ),
    );
  }

  // MARK: 왼쪽 아이콘
  Widget? _left() {
    if (leftImage != null) {
      return SizedBox(
          width: 24, height: 24, child: leftImage!.icon(width: 24, height: 24));
    } else if (leftEmoji != null) {
      return SizedBox(
          width: 24,
          child: YHText(
              text: leftEmoji ?? "",
              font: YHFont.regular24,
              color: YHColor.textDefault));
    } else {
      return null;
    }
  }

  // MARK: 타이틀
  Widget? _title() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ㅡㅡㅡㅡㅡ 타이틀 ㅡㅡㅡㅡㅡ
        if (titleWidget != null)
          titleWidget!
        else
          YHText(
            text: title ?? "",
            font: titleFont,
            color: titleColor ?? YHColor.textDefault,
            maxLines: titleMaxLines,
          ),
        // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
        // ㅡㅡㅡㅡㅡ 레드 닷 ㅡㅡㅡㅡㅡ
        if (redDot)
          Container(
            margin: const EdgeInsets.fromLTRB(2, 4, 0, 0),
            width: redDotSize,
            height: redDotSize,
            decoration: redDotDecoration,
          ),
        // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
      ],
    );
  }

  // MARK: 서브타이틀
  Widget? _subtitle() {
    if (subtitleWidget != null) {
      return subtitleWidget!;
    } else if (subtitle != null) {
      return YHText(
        text: subtitle ?? "",
        font: subtitleFont,
        color: subtitleColor ?? YHColor.textSub,
        maxLines: subtitleMaxLines,
      );
    } else {
      return null;
    }
  }

  // MARK: 오른쪽
  Widget _right() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (right != null) right!,
        if (rightImage != null) rightImage!.icon(width: 24, height: 24),
        if (initialToggleValue != null)
          YHSwitch(
              initialValue: initialToggleValue ?? false, onChanged: onToggle!),
        if (rightText != null)
          YHText(
              text: rightText!,
              font: rightTextFont,
              color: rightTextColor ?? YHColor.textSub),
        if (rightFutureText != null)
          FutureBuilder(
              future: rightFutureText!,
              builder: (context, snapshot) {
                return YHText(
                    text: snapshot.data ?? "",
                    font: YHFont.regular16,
                    color: rightTextColor ?? YHColor.textSub);
              }),
        if (showArrow)
          YHImage.icon_right_216
              .icon(width: 24, height: 24, color: YHColor.iconDefault),
      ],
    );
  }
}
