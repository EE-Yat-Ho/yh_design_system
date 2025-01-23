// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

enum YHImage {
  // MARK: - Common
  icon_camera,
  icon_close,
  icon_down,
  icon_left,
  icon_plus_white,
  icon_plus,
  icon_photo,
  icon_refresh,
  icon_right,
  icon_save,
  icon_save_white,
  // premium & donation
  icon_bus,
  icon_coffee,
  icon_chicken,
  icon_salad,
  icon_steak,
  icon_premium_menu,
  icon_premium_noAd,
  icon_premium_month,

  // MARK: - Nemo
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

  background,
  launch_logo,

  icon_alarm,
  icon_bag,
  icon_bag_white,
  icon_check_blue,
  icon_check_red,
  icon_copy_right,
  icon_email,
  icon_language,
  icon_memo,
  icon_note,
  icon_question,
  icon_rating,
  icon_runner,
  icon_send,
  icon_speaker,
  icon_timer,
  icon_xlsx,

  // MARK: - Memory Log
  memory_log_logo,
  icon_apple,
  icon_google,
  icon_setting,
  profile_rabbit,
  profile_bear,
  book_cover,
  sample0,
  sample1,
  sample2,
  sample3,
  tape_blue,
  tape_red,
}

extension YHImageImage on YHImage {
  Image icon(
      {double width = 24,
      double height = 24,
      YHColor? color,
      BoxFit? fit = BoxFit.fitHeight}) {
    return Image.asset("images/$name.png",
        width: width, height: height, color: color?.color, fit: fit);
  }

  ImageProvider get imageProvider {
    return AssetImage('images/$name.png');
  }
}
