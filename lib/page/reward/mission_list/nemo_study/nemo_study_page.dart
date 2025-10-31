import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_design_system/atoms/button/button.dart";
import "package:yh_design_system/atoms/button/solid_button.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/atoms/transform/transform.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "package:yh_util/domain/entities/reward_type.dart";
import "bloc/nemo_study_bloc.dart";

final class NemoStudyPage extends StatelessWidget {
  const NemoStudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<NemoStudyBloc>();

    if (bloc.state.rewardInfo == null) {
      return const SizedBox.shrink();
    }

    return YHScaffold(
      appBar: _appbar(context, bloc),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              YHText(
                text: "yh_design_system.page.nemo_study.title"
                    .tr(args: [RewardType.NEMO_STUDY.rewardPoint.toString()]),
                font: YHFont.regular24,
                color: YHColor.textDefault,
                align: TextAlign.center,
              ),
              YHImage.image_tv_216.icon(width: 250, height: 250),
              YHTransform(
                offset: const Offset(0, -30),
                child: YHText(
                  text: bloc.state.remainNemoStudyCount > 0
                      ? "yh_design_system.page.nemo_study.remaining_count".tr(
                          args: [bloc.state.remainNemoStudyCount.toString()])
                      : "yh_design_system.page.nemo_study.all_watched".tr(
                          args: [RewardType.NEMO_STUDY.threshold.toString()]),
                  font: YHFont.regular18,
                  color: YHColor.textSub,
                  align: TextAlign.center,
                ),
              ),
              const Spacer(flex: 3),
              YHSolidButton(
                  isEnabled: bloc.state.remainNemoStudyCount > 0,
                  title: bloc.state.remainNemoStudyCount > 0
                      ? "yh_design_system.page.nemo_study.watch_ad".tr()
                      : "yh_design_system.page.nemo_study.thank_you".tr(),
                  font: YHFont.regular18,
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  onTap: () => bloc.add(NemoStudyDidTap())),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context, NemoStudyBloc bloc) {
    return YHAppBar(
      right: YHButton(
        width: 40,
        height: 40,
        onTap: () => bloc.add(ToggleReddot()),
        image: bloc.state.enableReddot
            ? YHImage.icon_alarm_128.icon(width: 24, height: 24)
            : YHImage.icon_alarm_128.iconWithOff(width: 24, height: 24),
        backgroundColor: YHColor.transparent,
        useShadow: false,
      ),
      rightPadding: 10,
    );
  }
}
