import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "package:yh_util/common/constants.dart";
import "bloc/cash_out_result_bloc.dart";

final class CashOutResultPage extends StatelessWidget {
  const CashOutResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final bloc = context.watch<CashOutResultBloc>();
    return YHScaffold(
      appBar: const YHAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              YHText(
                text: "yh_design_system.page.cash_out_result.title"
                    .tr(args: [YHUtilConstants.rewardCashOutAmount.toString()]),
                font: YHFont.regular24,
                color: YHColor.black,
                align: TextAlign.center,
              ),
              YHImage.image_coin_750.icon(width: 250, height: 250),
              const SizedBox(height: 4),
              YHText(
                text: "yh_design_system.page.cash_out_result.subtitle".tr(),
                font: YHFont.regular18,
                color: YHColor.textSub,
              ),
              const SizedBox(height: 4),
              YHText(
                text: "yh_design_system.page.cash_out_result.thank_you".tr(),
                font: YHFont.regular18,
                color: YHColor.textSub,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
