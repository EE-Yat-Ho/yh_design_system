import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_design_system/atoms/card/card.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/column/column.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/collection/cell.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "package:yh_design_system/organisms/snack_bar/snack_bar.dart";
import "package:yh_util/common/theme.dart";
import "package:yh_util/domain/entities/yh_user.dart";
import "package:yh_util/int_util.dart";
import "bloc/cash_out_bloc.dart";

final class CashOutPage extends StatefulWidget {
  const CashOutPage({super.key});

  @override
  State<CashOutPage> createState() => _CashOutPageState();
}

final class _CashOutPageState extends State<CashOutPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CashOutBloc>();
    final user = bloc.state.user;

    return YHScaffold(
      paperBackground: true,
      appBar: YHAppBar(
        title: "yh_design_system.page.reward_main.cash_out_title".tr(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 150),
            child: YHColumn(
              children: [
                // 공지 배너
                YHCard(
                  backgroundColor: YHColor.surfaceAccentYellowWeak,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  useShadow: false,
                  cornerRadius: 12,
                  child: YHColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      YHText(
                        text:
                            "yh_design_system.page.cash_out.notice_banner_title"
                                .tr(),
                        font: YHFont.bold16,
                        color: YHColor.textDefault,
                      ),
                      const SizedBox(height: 8),
                      YHText(
                        text:
                            "yh_design_system.page.cash_out.notice_banner_subtitle"
                                .tr(),
                        font: YHFont.regular14,
                        color: YHColor.textSub,
                      ),
                    ],
                  ),
                ),

                _point(bloc),
                const SizedBox(height: 24),

                // 프리미엄 옵션
                if (user != null) ...[
                  _purchaseCell(
                    context,
                    bloc,
                    user,
                    titleKey:
                        "yh_design_system.page.cash_out.premium_30days_title",
                    subtitleKey:
                        "yh_design_system.page.cash_out.premium_30days_subtitle",
                    days: 30,
                    point: 2200,
                    image: YHImage.icon_premium_month_128,
                    borderColor: YHColor.blue500,
                    borderWidth: 2,
                    count: user.monthCount,
                  ),
                  _purchaseCell(
                    context,
                    bloc,
                    user,
                    titleKey:
                        "yh_design_system.page.cash_out.premium_365days_title",
                    subtitleKey:
                        "yh_design_system.page.cash_out.premium_365days_subtitle",
                    days: 365,
                    point: 22000,
                    image: YHImage.icon_premium_year_128,
                    borderColor: YHColor.gold,
                    borderWidth: 3,
                    count: user.yearCount,
                  ),
                ],

                // 프리미엄 혜택 셀 (premium_page.dart 코드 참고)
                YHCell(
                  id: 1,
                  backgroundColor:
                      YHColor.gold.withAlpha(YHTheme.isDarkMode ? 125 : 200),
                  showArrow: false,
                  contentPadding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                  titleWidget: YHColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                        child: YHText(
                            text: "page.premium_and_support.premium_benefits"
                                .tr(),
                            font: YHFont.bold16,
                            color: YHColor.textDefault),
                      ),
                      _benefitItem("page.premium_and_support.ai_import".tr()),
                      _benefitItem("page.premium_and_support.remove_ads".tr()),
                      _benefitItem(
                          "page.premium_and_support.note_sharing".tr()),
                      _benefitItem(
                          "page.premium_and_support.excel_export".tr()),
                      _benefitItem(
                          "page.premium_and_support.text_to_speech".tr()),
                      _benefitItem(
                          "page.premium_and_support.cloud_backup".tr()),
                    ],
                  ),
                ),

                // 더 나은 서비스와 지속가능한 발전 셀 (premium_page.dart 코드 참고)
                YHCell(
                  id: 1,
                  showArrow: false,
                  contentPadding: const EdgeInsets.fromLTRB(8, 12, 0, 12),
                  titleWidget: YHColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: YHText(
                            text:
                                "page.premium_and_support.better_service1".tr(),
                            font: YHFont.regular14,
                            color: YHColor.textSub),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: YHText(
                            text:
                                "page.premium_and_support.better_service2".tr(),
                            font: YHFont.regular14,
                            color: YHColor.textSub),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _benefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: YHText(
        text: "• $text",
        font: YHFont.regular14,
        color: YHColor.textDefault,
      ),
    );
  }

  Widget _purchaseCell(
    BuildContext context,
    CashOutBloc bloc,
    YHUser user, {
    required String titleKey,
    required String subtitleKey,
    required int days,
    required int point,
    required YHImage image,
    required Color borderColor,
    required double borderWidth,
    required int count,
  }) {
    return YHCell(
      id: days,
      title: titleKey.tr(),
      subtitle: subtitleKey.tr(),
      leftImage: image,
      showArrow: false,
      borderColor: borderColor,
      borderWidth: borderWidth,
      rightText: count.toString(), // 스크린샷 0 표시 위치
      onTap: () {
        if (user.point >= point) {
          _showPurchaseDialog(context, bloc, days, point);
        } else {
          YHSnackBar.show(
            context,
            "yh_design_system.page.cash_out.insufficient_cash".tr(),
            variant: SnackBarVariant.error,
          );
        }
      },
    );
  }

  void _showPurchaseDialog(
      BuildContext context, CashOutBloc bloc, int days, int point) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: YHText(
            text: "교환하시겠습니까?", font: YHFont.bold18, color: YHColor.textDefault),
        content: YHText(
          text: "$point 캐시를 사용하여 프리미엄 $days일을 활성화합니다.",
          font: YHFont.regular16,
          color: YHColor.textDefault,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: YHText(
                text: "취소", font: YHFont.regular16, color: YHColor.textSub),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              bloc.add(PurchasePremiumDidTap(days: days, point: point));
              YHSnackBar.show(
                context,
                "yh_design_system.page.cash_out.purchase_success".tr(),
                variant: SnackBarVariant.success,
              );
            },
            child:
                YHText(text: "교환", font: YHFont.bold16, color: YHColor.blue500),
          ),
        ],
      ),
    );
  }

  Widget _point(CashOutBloc bloc) {
    if (bloc.state.type == CashOutType.initial) {
      return CircularProgressIndicator(color: YHColor.primary);
    }

    final point = bloc.state.user?.point ?? 0;
    final formatted = IntUtil.moneyFormat(point);

    return YHCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      useShadow: false,
      child: Row(
        children: [
          YHText(
              text: "yh_design_system.page.cash_out.my_cash".tr(),
              font: YHFont.regular18,
              color: YHColor.textDefault),
          const Spacer(),
          YHText(
              text: "$formatted 🪙",
              font: YHFont.regular18,
              color: YHColor.textDefault),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
