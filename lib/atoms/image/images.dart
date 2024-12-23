// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

enum YHImage {
  // special
  background,
  launch_logo,
  // exam
  icon_right_blue,
  icon_fail_red,
  icon_fail_blue,
  icon_end_exam,
  // exam options
  icon_off,
  icon_shuffle,
  icon_decision,
  // charactors
  char_question_mark,
  char_really,
  char_write,
  // premium & donation
  icon_bus,
  icon_coffee,
  icon_chicken,
  icon_salad,
  icon_steak,
  icon_premium_menu,
  icon_premium_noAd,
  icon_premium_month,

  icon_alarm,
  icon_bag,
  icon_bag_white,
  icon_camera,
  icon_check_blue,
  icon_check_red,
  icon_close,
  icon_copy_right,
  icon_down,
  icon_email,
  icon_language,
  icon_left,
  icon_memo,
  icon_note,
  icon_plus_white,
  icon_plus,
  icon_photo,
  icon_question,
  icon_rating,
  icon_refresh,
  icon_runner,
  icon_right,
  icon_save,
  icon_save_white,
  icon_send,
  icon_speaker,
  icon_timer,
  icon_xlsx,
}

extension YHImageImage on YHImage {
  Image icon({double width = 24, double height = 24, YHColor? color}) {
    return Image.asset("images/$name.png",
        width: width,
        height: height,
        color: color?.color,
        fit: BoxFit.fitHeight);
  }

  ImageProvider get imageProvider {
    return AssetImage('images/$name.png');
  }
}
