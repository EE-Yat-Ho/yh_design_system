import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

class TRSwitch extends StatefulWidget {
  const TRSwitch({
    super.key,
    this.initialValue = false,
    this.width = 56.0,
    this.height = 28.0,
    this.duration = const Duration(milliseconds: 100),
    this.ballSize = 24.0,
    this.ballPadding = 2.0,
    this.onChanged,
    this.onBGColor,
    this.offBGColor = YHColor.actionDisabled,
    this.onBallColor = YHColor.white,
    this.offBallColor = YHColor.white,
    this.ballShadow = false,
    this.padding,
  });

  final bool initialValue;
  final double width;
  final double height;
  final Duration duration;
  final double ballSize;
  final double ballPadding;
  final void Function(bool)? onChanged;
  final YHColor? onBGColor;
  final YHColor offBGColor;
  final YHColor onBallColor;
  final YHColor offBallColor;
  final bool ballShadow;
  final EdgeInsets? padding;
  @override
  TRSwitchState createState() => TRSwitchState();
}

class TRSwitchState extends State<TRSwitch> {
  late bool isOn = widget.initialValue;
  late Color onBGColor = widget.onBGColor?.color ?? YHColor.primary.color;
  late Color switchColor = isOn ? onBGColor : widget.offBGColor.color;
  late double switchLeft = isOn
      ? (widget.width - widget.ballSize) - widget.ballPadding
      : widget.ballPadding;

  @override
  Widget build(BuildContext context) {
    if (widget.padding != null) {
      return Padding(
        padding: widget.padding!,
        child: _build(context),
      );
    }
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: widget.duration,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: switchColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
        ),
        child: renderSwitchBall(),
      ),
      onTap: () {
        isOn = !isOn;

        if (isOn) {
          switchColor = onBGColor;
          switchLeft = (widget.width - widget.ballSize) - widget.ballPadding;
        } else {
          switchColor = widget.offBGColor.color;
          switchLeft = widget.ballPadding;
        }

        if (widget.onChanged != null) {
          widget.onChanged!(isOn);
        }

        setState(() {});
      },
    );
  }

  renderSwitchBall() {
    final ballRadius = widget.ballSize / 2;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: widget.duration,
          top: widget.ballPadding,
          left: switchLeft,
          child: Container(
            width: widget.ballSize,
            height: widget.ballSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(ballRadius)),
              boxShadow: widget.ballShadow
                  ? const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 0),
                        blurRadius: 2,
                        spreadRadius: 0,
                      )
                    ]
                  : [],
              color:
                  isOn ? widget.offBallColor.color : widget.onBallColor.color,
            ),
          ),
        ),
      ],
    );
  }
}
