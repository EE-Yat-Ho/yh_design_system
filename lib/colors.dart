import 'package:flutter/material.dart';

enum YHColor {
  primary(color: Color.fromARGB(255, 75, 130, 255)),
  disable(color: Color.fromARGB(255, 172, 172, 172)),

  optionsBG(color: Color.fromARGB(255, 220, 223, 228)),
  note(color: Color.fromARGB(255, 255, 146, 10)),

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
