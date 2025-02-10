import 'package:flutter/cupertino.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

class YHSwitch extends StatefulWidget {
  const YHSwitch({
    super.key,
    this.value = false,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool) onChanged;

  @override
  State<YHSwitch> createState() => _YHSwitchState();
}

class _YHSwitchState extends State<YHSwitch> {
  late bool value = widget.value;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      activeTrackColor: YHColor.primary.color,
      onChanged: (bool? isOn) {
        widget.onChanged(isOn ?? false);
        setState(() {
          value = isOn ?? false;
        });
      },
    );
  }
}
