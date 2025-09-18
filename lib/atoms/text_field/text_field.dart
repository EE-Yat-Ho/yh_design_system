import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_design_system/atoms/button/button.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

enum BorderType { outline, underline, none }

final class YHTextField extends StatelessWidget {
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
    this.borderType = BorderType.outline,
    this.cornerRadius = 8,
    this.padding = const EdgeInsets.fromLTRB(16, 4, 32, 4),
    this.right,
    this.hideClear = true,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    // 색 관련
    this.textColor,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.borderColor, // 아래 색들이 선언되지 않았을 때 사용되는 기본색상
    this.disabledBorderColor,
    this.focusedBorderColor, // = YHColor.primary
    this.enabledBorderColor,
    this.errorBorderColor,
    // 키보드 done 버튼 관련
    this.textInputAction,
    this.onSubmitted,
    this.inputFormatters,
    // suffix, prefix icon 관련
    this.suffix,
    this.prefix,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
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
  final Color? textColor;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor; // 아래 색들이 선언되지 않았을 때 사용되는 기본색상
  final Color? disabledBorderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  // 키보드 done 버튼 관련
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  // suffix, prefix
  final Widget? suffix;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;

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
    final bgColor = enabled
        ? enabledBackgroundColor ?? YHColor.surfaceDefault
        : disabledBackgroundColor ?? YHColor.surfaceDisabled;

    InputBorder border;
    InputBorder enabledBorder;
    InputBorder focusedBorder;
    InputBorder disabledBorder;
    InputBorder errorBorder;

    final borderColor = this.borderColor ?? YHColor.strokeDefault;
    final enabledBorderColor = this.enabledBorderColor ?? YHColor.strokeDefault;
    final focusedBorderColor = this.focusedBorderColor ?? YHColor.primary;
    final disabledBorderColor =
        this.disabledBorderColor ?? YHColor.surfaceDisabled;
    final errorBorderColor = this.errorBorderColor ?? YHColor.surfaceError;

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
        errorBorder = OutlineInputBorder(
          borderSide: BorderSide(color: errorBorderColor, width: 1),
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
        errorBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: errorBorderColor, width: 1),
        );
        break;
      case BorderType.none:
        border = InputBorder.none;
        enabledBorder = InputBorder.none;
        focusedBorder = InputBorder.none;
        disabledBorder = InputBorder.none;
        errorBorder = InputBorder.none;
        break;
    }

    return TextField(
      expands: expands,
      cursorColor: YHColor.primary,
      keyboardType: textInputType ?? TextInputType.multiline,
      maxLines: obscureText ? 1 : maxLines,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      autofocus: autoFocus,
      focusNode: focusNode,
      enabled: enabled,
      decoration: InputDecoration(
        suffix: suffix,
        prefix: prefix,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: suffixIconColor,
        prefixIconColor: prefixIconColor,
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
        labelText: labelText,
        isDense: isDense,
        hintText: placeholder,
        hintStyle: font.style(color: YHColor.textPlaceholder),
        fillColor: bgColor,
        filled: true,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        errorBorder: errorBorder,
        contentPadding: padding,
      ),
      style: font.style(color: textColor ?? YHColor.textDefault),
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      // 키보드 done 버튼 관련
      textInputAction: textInputAction,
      onSubmitted: (value) => onSubmitted?.call(value),
      inputFormatters: inputFormatters,
    );
  }

  Widget _clearButton(BuildContext context) {
    return YHButton(
      onTap: () {
        onChanged("");
        controller?.clear();
      },
      autoResize: true,
      backgroundColor: YHColor.transparent,
      useShadow: false,
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
