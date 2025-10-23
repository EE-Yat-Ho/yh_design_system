import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "bloc/reward_result_bloc.dart";

final class RewardResultPage extends StatelessWidget {
  const RewardResultPage({super.key, required this.reward});
  final int reward;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final bloc = context.watch<RewardResultBloc>();
    return YHScaffold(
      appBar: const YHAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              YHText(
                text: "yh_design_system.page.reward_result.title"
                    .tr(args: [reward.toString()]),
                font: YHFont.regular24,
                color: YHColor.black,
                align: TextAlign.center,
              ),
              YHImage.image_coin_216.icon(width: 250, height: 250),
              YHText(
                text: "yh_design_system.page.reward_result.subtitle".tr(),
                font: YHFont.regular18,
                color: YHColor.textSub,
                align: TextAlign.center,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
