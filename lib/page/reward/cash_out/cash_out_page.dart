import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/router.dart";
import "package:yh_design_system/atoms/button/button.dart";
import "package:yh_design_system/atoms/button/solid_button.dart";
import "package:yh_design_system/atoms/card/card.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/column/column.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
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
    return YHScaffold(
      appBar: YHAppBar(
        rightPadding: 12,
        right: YHButton(
          text: YHText(
              text: "📋", font: YHFont.regular24, color: YHColor.textDefault),
          backgroundColor: YHColor.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          useShadow: false,
          onTap: () => context.pushNamed(YHRouteNames.cashOutRequestList),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: YHColumn(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              YHText(
                text: "page.cash_out.title".tr(),
                font: YHFont.regular22,
                color: YHColor.textDefault,
                align: TextAlign.center,
              ),
              const SizedBox(height: 4),
              YHText(
                text: "page.cash_out.subtitle".tr(),
                font: YHFont.regular20,
                color: YHColor.textSub,
              ),
              const SizedBox(height: 16),
              _point(bloc),
              Transform.scale(
                scale: 1.25,
                child: YHImage.image_coin_216.icon(width: 175, height: 175),
              ),
              const SizedBox(height: 40),
              YHText(
                text: "page.cash_out.coming_soon".tr(),
                font: YHFont.regular20,
                color: YHColor.textSub,
              ),
              YHSolidButton(
                  isEnabled: bloc.state.canCashOut,
                  title: bloc.state.canCashOut
                      ? "page.cash_out.cash_out_button".tr()
                      : "page.cash_out.insufficient_cash".tr(),
                  font: YHFont.regular20,
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  onTap: () => bloc.add(CashOutDidTap())),
            ],
          ),
        ),
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
              text: "page.cash_out.my_cash".tr(),
              font: YHFont.regular20,
              color: YHColor.textDefault),
          const Spacer(),
          YHText(
              text: "$formatted 🪙",
              font: YHFont.regular22,
              color: YHColor.textDefault),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
