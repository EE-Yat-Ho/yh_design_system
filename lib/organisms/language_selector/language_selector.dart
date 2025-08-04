import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/utils/localization_helper.dart';

final class YHLanguageSelector extends StatelessWidget {
  const YHLanguageSelector({
    super.key,
    this.onLanguageChanged,
  });

  final void Function(String languageCode)? onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: YHColor.white.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: YHColor.outline.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'common.language'.tr(),
            style: TextStyle(
              fontSize: YHFont.bold16.fontSize,
              fontWeight: YHFont.bold16.fontWeight,
              fontFamily: YHFont.fontFamily.name,
              color: YHColor.contentPrimary.color,
            ),
          ),
          const SizedBox(height: 16),
          ...LocalizationHelper.supportedLocales.map((locale) {
            final isSelected =
                context.locale.languageCode == locale.languageCode;

            return GestureDetector(
              onTap: () async {
                await LocalizationHelper.changeLocale(context, locale);
                onLanguageChanged?.call(locale.languageCode);
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? YHColor.primary.color.withAlpha(10)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        isSelected ? YHColor.primary.color : Colors.transparent,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      LocalizationHelper.getLanguageName(locale.languageCode),
                      style: TextStyle(
                        fontSize: YHFont.regular14.fontSize,
                        fontWeight: isSelected
                            ? YHFont.bold14.fontWeight
                            : YHFont.regular14.fontWeight,
                        fontFamily: YHFont.fontFamily.name,
                        color: isSelected
                            ? YHColor.primary.color
                            : YHColor.contentPrimary.color,
                      ),
                    ),
                    const Spacer(),
                    if (isSelected)
                      Icon(
                        Icons.check,
                        size: 20,
                        color: YHColor.primary.color,
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
