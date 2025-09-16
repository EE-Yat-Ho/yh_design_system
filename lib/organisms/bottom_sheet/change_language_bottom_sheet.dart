import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/card/card.dart';
import 'package:yh_design_system/atoms/column/column.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/text/text.dart';
import 'package:yh_design_system/organisms/bottom_sheet/bottom_sheet.dart';
import 'package:yh_design_system/organisms/snack_bar/snack_bar.dart';
import 'package:yh_util/common/localization_service.dart';

Future<dynamic> showChangeLanguageBottomSheet(BuildContext context,
    LocalizationServiceInterface localizationService) async {
  return showYHBottomSheet(
    context,
    fixHeight: 420,
    child: ChangeLanguageBottomSheet(
      localizationService: localizationService,
    ),
  );
}

final class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet(
      {super.key, required this.localizationService});

  final LocalizationServiceInterface localizationService;

  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YHColumn(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
      spacing: 8,
      children: [
        YHText(
          text: "common.language_setting".tr(),
          font: YHFont.bold18,
          color: YHColor.textDefault,
        ),
        const SizedBox(height: 16),
        ...widget.localizationService.supportedLocales().map(
              (locale) => _buildLanguageCard(context, locale),
            ),
      ],
    );
  }

  Widget _buildLanguageCard(BuildContext context, Locale locale) {
    final isSelected = context.locale == locale;

    return YHCard(
      cornerRadius: 12,
      backgroundColor: isSelected ? YHColor.primary : YHColor.surfaceDefault,
      onTap: () => _changeLanguage(context, locale),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: YHText(
                text: widget.localizationService.getLanguageName(locale),
                font: YHFont.bold16,
                color: isSelected ? YHColor.textWhite : YHColor.textDefault,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: YHColor.white,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) async {
    await widget.localizationService.changeLanguage(context, locale);

    // 언어 변경이 완료된 후 스낵바를 표시하기 위해 약간의 지연을 둠
    await Future.delayed(const Duration(milliseconds: 100));

    if (context.mounted) {
      YHSnackBar.show(
        context,
        'page.language_setting.complete'.tr(),
        variant: SnackBarVariant.success,
      );

      Navigator.pop(context);
    }
  }
}
