import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/button/ink_well.dart';
import 'package:yh_design_system/atoms/text_field/text_field.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';

// Designed Component
// figma: https://www.figma.com/design/Jw6ccaau53hwdo4bC7stXe/Knock-Design-System?node-id=253-5386&t=knkDlFiUnjpMyJso-0

final class YHSearchBar extends StatelessWidget {
  YHSearchBar({
    super.key,
    this.placeholder,
    this.onChanged,
    this.onTap,
    this.textFieldEnabled = true,
  });

  final String? placeholder;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool textFieldEnabled;

  final TextEditingController _controller = TextEditingController();
  // FocusNode _focusNode = FocusNode();
  // bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return YHInkWell(
      onTap: () => onTap?.call(),
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: YHColor.surfaceSub,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: YHColor.iconSub),
            const SizedBox(width: 8),
            Expanded(
              child: YHTextField(
                controller: _controller,
                onChanged: (value) => onChanged?.call(value),
                // focusNode: _focusNode,
                placeholder: placeholder,
                borderType: BorderType.none,
                padding: const EdgeInsets.all(0),
                isDense: true,
                enabledBackgroundColor: YHColor.surfaceSub,
                disabledBackgroundColor: YHColor.surfaceSub,
                font: YHFont.regular16,
                right: null,
                enabled: textFieldEnabled,
              ),
            ),
            // if (_controller.text.isNotEmpty)
            //   IconButton(
            //     icon: Icon(Icons.clear, color: YHColor.contentSecondary.color),
            //     onTap: () {
            //       _controller.clear();
            //       widget.onChanged?.call('');
            //     },
            //   ),
            // YHButton(
            //   onTap: () => widget.onTap?.call(),
            //   text: const YHText(
            //     text: '취소',
            //     font: YHFont.regular14,
            //     color: YHColor.textDefault,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
