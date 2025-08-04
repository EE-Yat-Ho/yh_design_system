<!--
배포 방법
  pub.dev : flutter packages pub publish
  사용하는 프로젝트에서 아래 커맨드 수행
  flutter clean
  flutter pub get 

  github : main 브랜치 푸시
  사용하는 프로젝트에서 
  pubspec.lock 삭제
  flutter pub get

-->

yhlab's design system package

## Features

- 다국어 지원 (한국어, 영어, 일본어, 중국어)
- 디자인 시스템 컴포넌트
- 일관된 UI/UX

## Getting started

### 1. 의존성 추가

```yaml
dependencies:
  yh_design_system:
    git:
      url: https://github.com/EE-Yat-Ho/yh_design_system.git
      ref: main
  easy_localization: ^3.0.8
  intl: 0.19.0
```

### 2. 번역 파일 추가

`assets/translations/` 폴더에 번역 파일들을 추가하세요:

```yaml
flutter:
  assets:
    - assets/translations/
```

### 3. 앱 초기화

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:yh_design_system/yh_design_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationHelper.supportedLocales,
      path: LocalizationHelper.translationsPath,
      fallbackLocale: const Locale('ko', 'KR'),
      child: MyApp(),
    ),
  );
}
```

## Usage

### 다국어 지원 사용법

```dart
// 텍스트 번역
Text('common.confirm'.tr())

// 언어 변경
await LocalizationHelper.changeLocaleByLanguageCode(context, 'en');

// 언어 선택 위젯 사용
YHLanguageSelector(
  onLanguageChanged: (languageCode) {
    print('Language changed to: $languageCode');
  },
)
```

### 디자인 시스템 컴포넌트 사용법

```dart
// 세그먼트 컨트롤
YHSegmentControl(
  segments: ['design_system.segment_control.segment_1'.tr(), 
             'design_system.segment_control.segment_2'.tr()],
  selectedIndex: 0,
  onSegmentSelected: (index) {
    // 선택 처리
  },
)
```

## Additional information

- GitHub: https://github.com/EE-Yat-Ho/yh_design_system
- 지원 언어: 한국어(ko-KR), 영어(en-US), 일본어(ja-JP), 중국어(zh-CN)
