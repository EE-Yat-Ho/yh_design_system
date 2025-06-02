// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

abstract interface class YHImageInterface {
  String get packageName;
}

enum YHImage implements YHImageInterface {
  // MARK: - Common
  icon_add_24,
  icon_apple_24,
  icon_back_line_24,
  icon_camera_48,
  icon_check_24,
  icon_close_24,
  icon_close_line_24,
  icon_down_24,
  icon_google_24,
  icon_hamburger_216,
  icon_left_24,
  icon_pencil_24,
  icon_photo_48,
  icon_plus_24,
  icon_plus_white_24,
  icon_refresh_48,
  icon_right_144,
  icon_save_24,
  icon_setting_216,
  icon_text_field_clear_24,

  image_calender,
  image_coin,
  image_tv,

  // MARK: - Nemo
  image_make_bag,
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
  icon_xlsx;

  @override
  String get packageName => 'yh_design_system';
}

extension YHImageImage on YHImage {
  Image icon(
      {double width = 24,
      double height = 24,
      YHColor? color,
      BoxFit fit = BoxFit.fitHeight,
      String? package}) {
    return Image.asset(
      "assets/images/$name.png",
      width: width,
      height: height,
      color: color?.color,
      fit: fit,
      package: package ?? packageName,
    );
  }

  ImageProvider get imageProvider {
    return AssetImage('assets/images/$name.png');
  }
}
