import 'package:flutter/material.dart';
import 'package:yh_design_system/components/buttons/option_button.dart';
import 'package:yh_design_system/images.dart';

class YHShuffleOptionButton extends StatelessWidget {
  const YHShuffleOptionButton({
    super.key,
    required this.isOn,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return YHOptionButton(
        title: "순서 섞기",
        description: isOn ? "on" : "off",
        isOn: isOn,
        image: YHImage.icon_shuffle,
        onPressed: onPressed);
  }
}
