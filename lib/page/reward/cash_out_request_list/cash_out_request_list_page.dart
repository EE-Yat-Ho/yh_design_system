import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_util/domain/entities/cash_out_request.dart";
import "package:yh_design_system/atoms/card/card.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/column/column.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "package:yh_util/date_service.dart";
import "bloc/cash_out_request_list_bloc.dart";

final class CashOutRequestListPage extends StatelessWidget {
  const CashOutRequestListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CashOutRequestListBloc>();
    return YHScaffold(
      appBar: YHAppBar(
        backgroundColor: YHColor.transparent,
        title: "yh_design_system.page.cash_out_request_list.title".tr(),
        titleFont: YHFont.regular18,
      ),
      body: SafeArea(
        bottom: false,
        child: _buildContent(context, bloc),
      ),
    );
  }

  Widget _buildContent(BuildContext context, CashOutRequestListBloc bloc) {
    if (bloc.state.type == CashOutRequestListType.initial ||
        bloc.state.type == CashOutRequestListType.loading) {
      return const SizedBox(width: double.infinity);
    }

    if (bloc.state.type == CashOutRequestListType.failure) {
      return Center(
        child: YHText(
          text:
              "yh_design_system.page.cash_out_request_list.loading_failed".tr(),
          font: YHFont.regular16,
          color: YHColor.textDefault,
        ),
      );
    }

    if (bloc.state.cashOutRequests.isEmpty) {
      return Center(
        child: YHText(
          text: "yh_design_system.page.cash_out_request_list.empty_list".tr(),
          font: YHFont.regular18,
          color: YHColor.textDefault,
        ),
      );
    }
    return SingleChildScrollView(
      child: _cashOutRequestColumn(context, bloc),
    );
  }

  Widget _cashOutRequestColumn(
      BuildContext context, CashOutRequestListBloc bloc) {
    return YHColumn(
      spacing: 16,
      padding: const EdgeInsets.all(16),
      children: [
        ...bloc.state.cashOutRequests.map((e) => _cashOutRequestCard(e)),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _cashOutRequestCard(CashOutRequest request) {
    final createdAt =
        "${request.createdAt.year}/${request.createdAt.month}/${request.createdAt.day}(${request.createdAt.koreanWeekday}) ${request.createdAt.hour}:${request.createdAt.minute}";
    return YHCard(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YHText(
            text: "🏦 ${request.account} ${request.bank} ${request.name}",
            font: YHFont.regular16,
            color: YHColor.textDefault,
          ),
          const SizedBox(height: 4),
          YHText(
            text: "🕒 $createdAt",
            font: YHFont.regular16,
            color: YHColor.textDefault,
          ),
          const SizedBox(height: 4),
          YHText(
            text:
                "🪙 ${request.amount.toString()}${"yh_design_system.page.cash_out_request_list.cash_suffix".tr()}",
            font: YHFont.regular16,
            color: YHColor.textDefault,
          ),
          const SizedBox(height: 4),
          YHText(
            text:
                "${request.status == "PENDING" ? "⏳" : "✅"} ${request.status}",
            font: YHFont.regular16,
            color: YHColor.textDefault,
          ),
        ],
      ),
    );
  }
}
