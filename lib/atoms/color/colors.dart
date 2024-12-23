import 'package:flutter/material.dart';

enum YHColor {
  primary(color: Color.fromARGB(255, 75, 130, 255)),
  disable(color: Color.fromARGB(255, 172, 172, 172)),
  supportWarning(color: Color.fromRGBO(248, 87, 82, 1)),

  contentPrimary(color: Color.fromRGBO(14, 19, 27, 1)),
  contentSecondary(color: Color.fromRGBO(123, 142, 163, 1)),
  contentTertiary(color: Color.fromRGBO(255, 255, 255, 1)),

  surface02(color: Color.fromRGBO(234, 237, 242, 1)),
  surface03(color: Color.fromRGBO(246, 247, 249, 1)),
  surface05(color: Color.fromRGBO(255, 255, 255, 1)),

  gray90(color: Color.fromRGBO(213, 220, 229, 1)),

  optionsBG(color: Color.fromARGB(255, 220, 223, 228)),
  note(color: Color.fromARGB(255, 255, 146, 10)),

  opacity(color: Color.fromRGBO(0, 0, 0, 0)),
  white(color: Color.fromARGB(255, 255, 255, 255)),
  gray(color: Color.fromARGB(255, 172, 172, 172)),
  black(color: Color.fromARGB(255, 17, 17, 17)),
  red(color: Color.fromARGB(255, 255, 0, 0)),
  gold(color: Color.fromARGB(255, 255, 187, 0));

  const YHColor({
    required this.color,
  });

  final Color color;
}
