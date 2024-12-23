import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/components/card/card.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

class YHTextFieldCard extends StatelessWidget {
  const YHTextFieldCard({
    super.key,
    this.labelText = "",
    required this.controller,
    this.obscureText = false,
    this.onChanged,
    this.textInputType,
    this.isDense,
    this.autofocus = false,
    this.enabled = true,
    this.focusNode,
    this.maxLines,
    this.placeholder,
  });

  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final bool? isDense;
  final bool autofocus;
  final bool enabled;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    final bgColor = enabled
        ? YHColor.white.color
        : const Color.fromARGB(255, 172, 172, 172);

    return YHCard(
      // child: Padding(
      // padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      // child: Theme(
      //   data: Theme.of(context), //.copyWith(splashColor: Colors.transparent),
      child: TextField(
        // expands: true,
        cursorColor: YHColor.primary.color,
        keyboardType: textInputType ?? TextInputType.multiline,
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        autofocus: autofocus,
        focusNode: focusNode,
        enabled: enabled,

        // autofillHints: ["autofillHints"],
        // strutStyle: StrutStyle(
        //   fontSize: 10
        // ),
        decoration: InputDecoration(
          // labelText: labelText,
          // fillColor: Colors.red,
          // color
          isDense: isDense,
          // labelStyle: TextStyle(
          //   color: YHColor.black.color,
          //   decorationColor: YHColor.gray.color,
          //   fontWeight: YHFont.regular14.fontWeight,
          //   fontSize: YHFont.h1.size,
          // ),

          hintText: placeholder,
          hintStyle: YHFont.body5.style(color: YHColor.contentSecondary.color),

          fillColor: bgColor,
          filled: true,

          // border: InputBorder.none, // OutlineInputBorder(),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: bgColor, width: 0),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bgColor, width: 0),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bgColor, width: 0),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: bgColor, width: 0),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        ),
        style: YHFont.body5.style(color: YHColor.contentPrimary.color),
      ),
      // ),
      // )
    );
  }
}
