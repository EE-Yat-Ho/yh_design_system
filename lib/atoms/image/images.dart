// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

// 앱 프로젝트에서 특화된 이미지가 필요할 경우, 해당 인터페이스 구현하여 사용
abstract interface class YHImageInterface {
  // 앱 프로젝트 특화 이미지인 경우, 패키지 이름 null 이어야함
  String? get packageName;

  // enum 타입의 name 사용
  String get fileName;

  // 다크 모드 이미지 사용 여부
  bool get checkDarkMode;
}

enum YHImage implements YHImageInterface {
  // 로그인
  icon_apple_216,
  icon_google_216,

  // 기능
  icon_camera_48,
  icon_pencil_24,
  icon_photo_48,
  icon_alarm_128,
  icon_refresh_48,
  icon_search_48,
  icon_theme_128,

  // 색연필 느낌의 체크, 동그라미
  icon_circle_blue_130,
  icon_check_blue_100,
  icon_check_red_130,

  // 혜택
  image_calender_216,
  image_coin_216,
  image_tv_216,

  // 후원
  icon_bus_128,
  icon_chicken_128,
  icon_coffee_128,
  icon_salad_128,
  icon_steak_128,

  // 기타 기능
  icon_email_128,
  icon_language_128,
  icon_copy_right_48,

  // 옵션 끄기
  icon_off_22,

  // 기본 아이콘들
  icon_add_24,
  icon_back_24,
  icon_bookmark_on_48,
  icon_bookmark_off_48,
  icon_check_24,
  icon_close_24,
  icon_down_216,
  icon_drag_72,
  icon_hamburger_72,
  icon_sissor_48,
  icon_setting_216,
  icon_save_24,
  icon_send_48,
  icon_left_216,
  icon_remove_216,
  icon_right_216,
  icon_plus_24,
  icon_text_field_clear_24,
  icon_information_24,
  icon_check_circle_fill_216,
  icon_info_circle_fill_216,
  icon_warning_triangle_fill_216;

  @override
  String get packageName => 'yh_design_system';

  @override
  String get fileName => name;

  @override
  bool get checkDarkMode => false;
}

extension YHImageImage on YHImageInterface {
  Image icon(
      {double width = 24,
      double height = 24,
      Color? color,
      BoxFit fit = BoxFit.fitHeight,
      String? package}) {
    final fileName = checkDarkMode ? "${this.fileName}_dark" : this.fileName;
    return Image.asset(
      "assets/images/$fileName.png",
      width: width,
      height: height,
      color: color,
      fit: fit,
      package: package ?? packageName,
    );
  }

  Stack iconWithOff(
      {double width = 24,
      double height = 24,
      Color? color,
      BoxFit fit = BoxFit.fitHeight,
      String? package}) {
    return Stack(
      children: [
        icon(
            width: width,
            height: height,
            color: color,
            fit: fit,
            package: package),
        YHImage.icon_off_22.icon(width: width, height: height),
      ],
    );
  }

  // ImageProvider get imageProvider {
  //   return AssetImage('assets/images/$fileName.png');
  // }
}
