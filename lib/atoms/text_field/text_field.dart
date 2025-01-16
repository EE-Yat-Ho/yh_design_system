import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

enum BorderType { outline, underline }

class YHTextField extends StatelessWidget {
  const YHTextField({
    super.key,
    this.labelText,
    this.controller,
    this.obscureText = false,
    required this.onChanged,
    this.textInputType,
    this.isDense,
    this.autofocus = false,
    this.enabled = true,
    this.focusNode,
    this.maxLines = 1,
    this.placeholder,
    this.borderType = BorderType.outline,
    this.cornerRadius = 8,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 32, 4),
    this.right,
    this.hideClear = false,
  });

  final String? labelText;
  final EdgeInsets padding;
  final TextEditingController? controller;
  final bool obscureText;
  final void Function(String) onChanged;
  final TextInputType? textInputType;
  final bool? isDense;
  final bool autofocus;
  final bool enabled;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? placeholder;
  final double cornerRadius;
  final BorderType borderType;
  final Widget? right;
  final bool hideClear;
  @override
  Widget build(BuildContext context) {
    Widget rightWidget;
    if (right != null) {
      rightWidget = right!;
    } else if (controller?.text.isNotEmpty ?? false) {
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
    final bgColor = enabled ? YHColor.white.color : YHColor.disable.color;

    InputBorder border;
    InputBorder enabledBorder;
    InputBorder focusedBorder;
    InputBorder disabledBorder;

    if (borderType == BorderType.outline) {
      final borderRadius = BorderRadius.circular(cornerRadius);
      border = OutlineInputBorder(
        borderSide: BorderSide(color: YHColor.primary.color, width: 1),
        borderRadius: borderRadius,
      );
      enabledBorder = OutlineInputBorder(
        borderSide: BorderSide(color: YHColor.outline.color, width: 1),
        borderRadius: borderRadius,
      );
      focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: YHColor.primary.color, width: 1),
        borderRadius: borderRadius,
      );
      disabledBorder = OutlineInputBorder(
        borderSide: BorderSide(color: YHColor.disable.color, width: 1),
        borderRadius: borderRadius,
      );
    } else {
      border = UnderlineInputBorder(
        borderSide: BorderSide(color: YHColor.primary.color, width: 1),
      );
      enabledBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: YHColor.outline.color, width: 1),
      );
      focusedBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: YHColor.primary.color, width: 1),
      );
      disabledBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: YHColor.disable.color, width: 1),
      );
    }

    return TextField(
      // expands: false,
      cursorColor: YHColor.primary.color,
      keyboardType: textInputType ?? TextInputType.multiline,
      maxLines: obscureText ? 1 : maxLines,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
      enabled: enabled,

      decoration: InputDecoration(
        labelText: labelText,
        isDense: isDense,
        hintText: placeholder,
        hintStyle: YHFont.body2.style(color: YHColor.placeholder.color),
        fillColor: bgColor,
        filled: true,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        contentPadding: padding,
      ),
      style: YHFont.body2.style(color: YHColor.contentPrimary.color),
    );
  }

  Widget _clearButton(BuildContext context) {
    return YHButton(
      onPressed: () {
        onChanged("");
        controller?.clear();
      },
      autoResize: true,
      backgroundColor: YHColor.opacity,
      shadow: false,
      image: Image.asset("images/text_field_clear_icon.png",
          width: 24, height: 24, fit: BoxFit.fitHeight),
      width: 40,
      height: 40,
    );
  }
}
