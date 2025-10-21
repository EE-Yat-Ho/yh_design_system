import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/router.dart";
import "package:yh_design_system/atoms/card/card.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/column/column.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/collection/cell.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "package:yh_util/int_util.dart";
import "bloc/reward_main_bloc.dart";

final class RewardMainPage extends StatelessWidget {
  const RewardMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<RewardMainBloc>();
    return YHScaffold(
      appBar: YHAppBar(
        title: "yh_design_system.page.reward_main.title".tr(),
        titleFont: YHFont.regular18,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: YHColumn(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              YHText(
                  text: "yh_design_system.page.reward_main.subtitle".tr(),
                  font: YHFont.regular16,
                  color: YHColor.textSub),
              const SizedBox(height: 32),
              _point(bloc),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
              _list(bloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _point(RewardMainBloc bloc) {
    if (bloc.state.type == RewardMainType.initial) {
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

  Widget _list(RewardMainBloc bloc) {
    return Column(
      spacing: 0,
      children: [
        YHCell(
            id: 0,
            margin: const EdgeInsets.symmetric(vertical: 12),
            title: "yh_design_system.page.reward_main.mission_title".tr(),
            subtitle: "yh_design_system.page.reward_main.mission_subtitle".tr(),
            redDot: bloc.state.showRedDot,
            onTap: () => navigatorKey.currentContext!
                .pushNamed(YHRouteNames.missionList)),
        YHCell(
            id: 1,
            margin: const EdgeInsets.symmetric(vertical: 12),
            title: "yh_design_system.page.reward_main.cash_out_title".tr(),
            subtitle:
                "yh_design_system.page.reward_main.cash_out_subtitle".tr(),
            onTap: () =>
                navigatorKey.currentContext!.pushNamed(YHRouteNames.cashOut)),
      ],
    );
  }
}
