import 'package:flutter/cupertino.dart';
import 'package:yh_design_system/colors.dart';

class YHSwitch extends StatefulWidget {
  const YHSwitch({super.key, required this.onChanged});

  final void Function(bool) onChanged;

  @override
  State<YHSwitch> createState() => _YHSwitchState();
}

class _YHSwitchState extends State<YHSwitch> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: state,
      activeColor: YHColor.primary.color,
      onChanged: (bool? isOn) {
        widget.onChanged(isOn ?? false);
        setState(() {
          state = isOn ?? false;
        });
      },
    );
  }
}
