import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_util/common/reward_util.dart";
import "package:yh_design_system/atoms/button/solid_button.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/atoms/transform/transform.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "bloc/mission_ad_bloc.dart";

final class MissionAdPage extends StatelessWidget {
  const MissionAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MissionAdBloc>();

    if (bloc.state.type == MissionAdType.initial) {
      return const SizedBox.shrink();
    }

    return YHScaffold(
      appBar: const YHAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              YHText(
                text: "page.mission_ad.title".tr(),
                font: YHFont.regular30,
                color: YHColor.textDefault,
                align: TextAlign.center,
              ),
              YHImage.image_tv_216.icon(width: 250, height: 250),
              YHTransform(
                offset: const Offset(0, -30),
                child: YHText(
                  text: bloc.state.remainADWatchCount > 0
                      ? "page.mission_ad.remaining_count"
                          .tr(args: [bloc.state.remainADWatchCount.toString()])
                      : "page.mission_ad.all_watched"
                          .tr(args: [RewardUtil.DAILY_AD_THRESHOLD.toString()]),
                  font: YHFont.regular20,
                  color: YHColor.textSub,
                  align: TextAlign.center,
                ),
              ),
              const Spacer(flex: 3),
              YHSolidButton(
                  isEnabled: bloc.state.remainADWatchCount > 0,
                  title: bloc.state.remainADWatchCount > 0
                      ? "page.mission_ad.watch_ad".tr()
                      : "page.mission_ad.thank_you".tr(),
                  font: YHFont.regular20,
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  onTap: () => bloc.add(SeeAdDidTap())),
            ],
          ),
        ),
      ),
    );
  }
}
