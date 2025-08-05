// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// final class LocalizationHelper {
//   static const List<Locale> supportedLocales = [
//     Locale('ko', 'KR'), // 한국어
//     Locale('en', 'US'), // 영어
//     Locale('ja', 'JP'), // 일본어
//     Locale('zh', 'CN'), // 중국어
//   ];

//   static const String fallbackLocale = 'ko-KR';

//   static const String translationsPath = 'assets/translations';

//   /// 현재 로케일을 문자열로 반환
//   static String getCurrentLocaleString(BuildContext context) {
//     final locale = context.locale;
//     return '${locale.languageCode}-${locale.countryCode}';
//   }

//   /// 로케일 변경
//   static Future<void> changeLocale(BuildContext context, Locale locale) async {
//     await context.setLocale(locale);
//   }

//   /// 언어 코드로 로케일 변경
//   static Future<void> changeLocaleByLanguageCode(
//     BuildContext context,
//     String languageCode,
//   ) async {
//     final locale = supportedLocales.firstWhere(
//       (locale) => locale.languageCode == languageCode,
//       orElse: () => const Locale('ko', 'KR'),
//     );
//     await changeLocale(context, locale);
//   }

//   /// 언어 이름 반환
//   static String getLanguageName(String languageCode) {
//     switch (languageCode) {
//       case 'ko':
//         return '한국어';
//       case 'en':
//         return 'English';
//       case 'ja':
//         return '日本語';
//       case 'zh':
//         return '中文';
//       default:
//         return '한국어';
//     }
//   }

//   /// 언어 코드로 언어 이름 반환
//   static String getLanguageNameByCode(String languageCode) {
//     return getLanguageName(languageCode);
//   }

//   /// 현재 언어 이름 반환
//   static String getCurrentLanguageName(BuildContext context) {
//     return getLanguageName(context.locale.languageCode);
//   }
// }
