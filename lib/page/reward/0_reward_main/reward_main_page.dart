import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/page/reward/0_reward_main/bloc/reward_main_bloc.dart";
import "package:yh_design_system/router.dart";
import "package:yh_design_system/atoms/card/card.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/column/column.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/collection/cell.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "package:yh_util/domain/entities/reward_type.dart";
import "package:yh_util/int_util.dart";

final class RewardMainPage extends StatelessWidget {
  const RewardMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RewardMainBloc>();
    return YHScaffold(
      scrollable: true,
      insideSafeAreaFromLTRB: const [true, true, true, true],
      appBar: YHAppBar(
        title: "yh_design_system.page.reward_main.title".tr(),
        titleFont: YHFont.regular18,
      ),
      body: YHColumn(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 더 많은 혜택과 공생 방법을 항상 고민해요 🌾
          YHText(
              text: "yh_design_system.page.reward_main.subtitle".tr(),
              font: YHFont.regular16,
              color: YHColor.textSub),
          const SizedBox(height: 32),
          // 모은 캐시
          _point(bloc),
          const SizedBox(height: 8),
          // 출금하기
          YHCell(
              id: 1,
              title: "yh_design_system.page.reward_main.cash_out_title".tr(),
              leftEmoji: "✨",
              subtitle:
                  "yh_design_system.page.reward_main.cash_out_subtitle".tr(),
              onTap: () =>
                  navigatorKey.currentContext!.pushNamed(YHRouteNames.cashOut)),
          const SizedBox(height: 16),

          // 출석
          YHCell(
            id: 0,
            title: "yh_design_system.page.reward_main.attend_title"
                .tr(args: [RewardType.ATTEND.maxDailyPoint.toString()]),
            leftEmoji: "☘️",
            subtitle: "yh_design_system.page.reward_main.attend_subtitle"
                .tr(args: [RewardType.ATTEND.maxDailyPoint.toString()]),
            showArrow: false,
            rightText: "${bloc.state.remainAttendCash} 🪙",
            redDot: bloc.state.showAttendRedDot,
            onTap: () => context.pushNamed(YHRouteNames.attend),
          ),
          // 광고 시청
          YHCell(
            id: 2,
            title: "yh_design_system.page.reward_main.ad_title"
                .tr(args: [RewardType.AD_WATCH.maxDailyPoint.toString()]),
            leftEmoji: "💵",
            subtitle: "yh_design_system.page.reward_main.ad_subtitle"
                .tr(args: [RewardType.AD_WATCH.maxDailyPoint.toString()]),
            showArrow: false,
            rightText: "${bloc.state.remainWatchADCash} 🪙",
            redDot: bloc.state.showWatchADRedDot,
            onTap: () => context.pushNamed(YHRouteNames.ad),
          ),
          // 네모 공부
          YHCell(
            id: 1,
            title: "yh_design_system.page.reward_main.nemo_study_title"
                .tr(args: [RewardType.NEMO_STUDY.maxDailyPoint.toString()]),
            // leftImage: YHImage.icon_check_blue_100,
            leftEmoji: "🎯",
            subtitle: "yh_design_system.page.reward_main.nemo_study_subtitle"
                .tr(args: [RewardType.NEMO_STUDY.maxDailyPoint.toString()]),
            showArrow: false,
            rightText: "${bloc.state.remainNemoStudyCash} 🪙",
            redDot: bloc.state.showNemoStudyRedDot,
            onTap: () => context.pushNamed(YHRouteNames.nemoStudy),
          ),
          // YHCell(
          //     title: "👟 만보기",
          //     subtitle: "매일 출석하면 캐시를 얻을 수 있어요",
          //     rightType: YHCellRightType.none,
          //     onTap: () => {}),
          // YHCell(
          //     title: "🍀 복권",
          //     subtitle: "매일 출석하면 캐시를 얻을 수 있어요",
          //     rightType: YHCellRightType.none,
          //     onTap: () => {}),
          // 추가 예정
          YHCell(
            id: 2,
            title: "🛠️",
            subtitle:
                "yh_design_system.page.reward_main.coming_soon_subtitle".tr(),
            showArrow: false,
          ),
        ],
      ),
    );
  }

  Widget _point(RewardMainBloc bloc) {
    if (bloc.state.user == null) {
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
              text: "yh_design_system.page.reward_main.my_cash".tr(),
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
