import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

enum BorderType { outline, underline, none }

class YHTextField extends StatelessWidget {
  const YHTextField({
    super.key,
    this.labelText,
    this.font = YHFont.regular16,
    this.controller,
    this.obscureText = false,
    required this.onChanged,
    this.textInputType,
    this.isDense,
    this.autoFocus = false,
    this.enabled = true,
    this.focusNode,
    this.maxLines,
    this.placeholder,
    this.borderType = BorderType.none,
    this.cornerRadius = 8,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 32, 4),
    this.right,
    this.hideClear = true,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    // 색 관련
    this.backgroundColor = YHColor.white,
    this.disabledBackgroundColor = YHColor.disable,
    this.borderColor = YHColor.outline,
    this.disabledBorderColor = YHColor.disable,
    this.focusedBorderColor, // = YHColor.primary
    this.enabledBorderColor, // = YHColor.primary
  });

  final String? labelText;
  final YHFont font;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final bool obscureText;
  final void Function(String) onChanged;
  final TextInputType? textInputType;
  final bool? isDense;
  final bool autoFocus;
  final bool enabled;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? placeholder;
  final double cornerRadius;
  final BorderType borderType;
  final Widget? right;
  final bool hideClear;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  // 색 관련
  final YHColor backgroundColor;
  final YHColor disabledBackgroundColor;
  final YHColor borderColor;
  final YHColor disabledBorderColor;
  final YHColor? focusedBorderColor;
  final YHColor? enabledBorderColor;

  @override
  Widget build(BuildContext context) {
    Widget rightWidget;
    if (right != null) {
      rightWidget = right!;
    } else if ((controller?.text.isNotEmpty ?? false) && !hideClear) {
      rightWidget = _clearButton(context);
    } else {
      rightWidget = const SizedBox.shrink();
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        _textField(context),
        rightWidget,
      ],
    );
  }

  Widget _textField(BuildContext context) {
    final bgColor =
        enabled ? backgroundColor.color : disabledBackgroundColor.color;

    InputBorder border;
    InputBorder enabledBorder;
    InputBorder focusedBorder;
    InputBorder disabledBorder;

    final borderColor = this.borderColor.color;
    final enabledBorderColor =
        this.enabledBorderColor?.color ?? YHColor.primary.color;
    final focusedBorderColor =
        this.focusedBorderColor?.color ?? YHColor.primary.color;
    final disabledBorderColor = this.disabledBorderColor.color;

    switch (borderType) {
      case BorderType.outline:
        final borderRadius = BorderRadius.circular(cornerRadius);
        border = OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: borderRadius,
        );
        enabledBorder = OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1),
          borderRadius: borderRadius,
        );
        focusedBorder = OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
          borderRadius: borderRadius,
        );
        disabledBorder = OutlineInputBorder(
          borderSide: BorderSide(color: disabledBorderColor, width: 1),
          borderRadius: borderRadius,
        );
        break;
      case BorderType.underline:
        border = UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
        );
        enabledBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1),
        );
        focusedBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1),
        );
        disabledBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: disabledBorderColor, width: 1),
        );
        break;
      case BorderType.none:
        border = InputBorder.none;
        enabledBorder = InputBorder.none;
        focusedBorder = InputBorder.none;
        disabledBorder = InputBorder.none;
        break;
    }

    return TextField(
      expands: expands,
      cursorColor: YHColor.primary.color,
      keyboardType: textInputType ?? TextInputType.multiline,
      maxLines: obscureText ? 1 : maxLines,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      autofocus: autoFocus,
      focusNode: focusNode,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        isDense: isDense,
        hintText: placeholder,
        hintStyle: font.style(color: YHColor.placeholder.color),
        fillColor: bgColor,
        filled: true,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        contentPadding: padding,
      ),
      style: font.style(color: YHColor.contentPrimary.color),
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
    );
  }

  Widget _clearButton(BuildContext context) {
    return YHButton(
      onTap: () {
        onChanged("");
        controller?.clear();
      },
      autoResize: true,
      backgroundColor: YHColor.opacity,
      shadow: false,
      image: Image.asset(
        "assets/images/text_field_clear_icon.png",
        width: 24,
        height: 24,
        fit: BoxFit.fitHeight,
        package: "yh_design_system",
      ),
      width: 40,
      height: 40,
    );
  }
}
