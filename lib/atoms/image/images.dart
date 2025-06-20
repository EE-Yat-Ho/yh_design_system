// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';

// 앱 프로젝트에서 특화된 이미지가 필요할 경우, 해당 인터페이스 구현하여 사용
abstract interface class YHImageInterface {
  // 앱 프로젝트 특화 이미지인 경우, 패키지 이름 null 이어야함
  String? get packageName;

  // enum 타입의 name 사용
  String get fileName;
}

enum YHImage implements YHImageInterface {
  // 로그인
  icon_apple_24,
  icon_google_24,

  // 기능
  icon_camera_48,
  icon_pencil_24,
  icon_photo_48,
  icon_alarm_128,
  icon_refresh_48,

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
  icon_plus_24,
  icon_back_24,
  icon_close_24,
  icon_down_216,
  icon_hamburger_216,
  icon_sissor_48,
  icon_setting_216,
  icon_save_24,
  icon_send_48,
  icon_left_216,
  icon_right_216,
  icon_check_24,
  icon_text_field_clear_24;

  @override
  String get packageName => 'yh_design_system';

  @override
  String get fileName => name;
}

extension YHImageImage on YHImageInterface {
  Image icon(
      {double width = 24,
      double height = 24,
      YHColor? color,
      BoxFit fit = BoxFit.fitHeight,
      String? package}) {
    return Image.asset(
      "assets/images/$fileName.png",
      width: width,
      height: height,
      color: color?.color,
      fit: fit,
      package: package ?? packageName,
    );
  }

  ImageProvider get imageProvider {
    return AssetImage('assets/images/$fileName.png');
  }
}
