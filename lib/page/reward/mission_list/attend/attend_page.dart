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
import "package:yh_util/date_service.dart";
import "package:yh_util/domain/entities/reward_type.dart";
import "bloc/attend_bloc.dart";

final class AttendPage extends StatelessWidget {
  const AttendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AttendBloc>();
    final title =
        "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}(${DateTime.now().koreanWeekday})";
    return YHScaffold(
      appBar: _appbar(context, bloc),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              YHText(
                text: "yh_design_system.page.attend.title"
                    .tr(args: [RewardType.ATTEND.rewardPoint.toString()]),
                font: YHFont.regular24,
                color: YHColor.black,
                align: TextAlign.center,
              ),
              YHImage.image_calender_750.icon(width: 250, height: 250),
              YHTransform(
                offset: const Offset(0, -35),
                child: YHText(
                  text: title,
                  font: YHFont.regular18,
                  color: YHColor.textSub,
                  align: TextAlign.center,
                ),
              ),
              const Spacer(flex: 3),
              YHSolidButton(
                  isEnabled: bloc.state.canAttend,
                  title: bloc.state.canAttend
                      ? "yh_design_system.page.attend.attend_button".tr()
                      : "yh_design_system.page.attend.already_attended".tr(),
                  font: YHFont.regular18,
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  onTap: () => bloc.add(AttendDidTap())),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context, AttendBloc bloc) {
    return YHAppBar(
      right: YHButton(
        width: 40,
        height: 40,
        onTap: () => bloc.add(ToggleReddot()),
        image: bloc.state.enableReddot
            ? YHImage.icon_reddot_144.icon(width: 24, height: 24)
            : YHImage.icon_reddot_144.iconWithOff(width: 24, height: 24),
        backgroundColor: YHColor.transparent,
        useShadow: false,
      ),
      rightPadding: 10,
    );
  }
}
