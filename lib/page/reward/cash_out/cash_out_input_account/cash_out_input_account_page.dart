import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:yh_design_system/atoms/button/solid_button.dart";
import "package:yh_design_system/atoms/color/colors.dart";
import "package:yh_design_system/atoms/column/column.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/atoms/image/images.dart";
import "package:yh_design_system/atoms/text/text.dart";
import "package:yh_design_system/atoms/text_field/text_editing_controller.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/card/text_field_card.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "bloc/cash_out_input_account_bloc.dart";

final class CashOutInputAccountPage extends StatefulWidget {
  const CashOutInputAccountPage({super.key});

  @override
  State<CashOutInputAccountPage> createState() =>
      _CashOutInputAccountPageState();
}

final class _CashOutInputAccountPageState
    extends State<CashOutInputAccountPage> {
  final accountController = YHTextEditingController();
  final nameController = YHTextEditingController();
  final bankController = YHTextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CashOutInputAccountBloc>();
    return YHScaffold(
      appBar: const YHAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: YHColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              Center(
                  child: YHText(
                text: "yh_design_system.page.cash_out_input_account.title".tr(),
                font: YHFont.regular22,
                color: YHColor.textDefault,
                align: TextAlign.center,
              )),
              const SizedBox(height: 16),
              Center(
                  child: Transform.scale(
                scale: 1.25,
                child: YHImage.image_coin_216.icon(width: 175, height: 175),
              )),
              _inputAccountNumber(),
              const SizedBox(height: 8),
              _inputBankName(),
              const SizedBox(height: 8),
              _inputAccountHolder(),
              const SizedBox(height: 16),
              const Divider(color: YHColor.gray200),
              const SizedBox(height: 8),
              _notice(),
              const SizedBox(height: 16),
              YHSolidButton(
                  isEnabled: accountController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      bankController.text.isNotEmpty,
                  title:
                      "yh_design_system.page.cash_out_input_account.cash_out_button"
                          .tr(),
                  font: YHFont.regular20,
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  onTap: () => bloc.add(CashOutOnTap(
                        account: accountController.text,
                        name: nameController.text,
                        bank: bankController.text,
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputAccountNumber() {
    return Row(children: [
      YHText(
        text:
            "yh_design_system.page.cash_out_input_account.account_number".tr(),
        font: YHFont.regular20,
        color: YHColor.black,
      ),
      const SizedBox(width: 8),
      Flexible(
        child: YHTextFieldCard(
          controller: accountController,
          onChanged: (value) => {setState(() {})},
          cornerRadius: 0,
          placeholder:
              "yh_design_system.page.cash_out_input_account.account_number_placeholder"
                  .tr(),
          textInputType: TextInputType.number,
        ),
      ),
    ]);
  }

  Widget _inputBankName() {
    return Row(children: [
      YHText(
        text: "yh_design_system.page.cash_out_input_account.bank_name".tr(),
        font: YHFont.regular20,
        color: YHColor.black,
      ),
      const SizedBox(width: 8),
      Flexible(
        child: YHTextFieldCard(
          controller: bankController,
          onChanged: (value) => {setState(() {})},
          cornerRadius: 0,
          placeholder:
              "yh_design_system.page.cash_out_input_account.bank_name_placeholder"
                  .tr(),
          textInputType: TextInputType.name,
        ),
      ),
    ]);
  }

  Widget _inputAccountHolder() {
    return Row(children: [
      YHText(
        text:
            "yh_design_system.page.cash_out_input_account.account_holder".tr(),
        font: YHFont.regular20,
        color: YHColor.black,
      ),
      const SizedBox(width: 8),
      Flexible(
        child: YHTextFieldCard(
          controller: nameController,
          onChanged: (value) => {setState(() {})},
          cornerRadius: 0,
          placeholder:
              "yh_design_system.page.cash_out_input_account.account_holder_placeholder"
                  .tr(),
          textInputType: TextInputType.name,
        ),
      ),
    ]);
  }

  Widget _notice() {
    return YHColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YHText(
          text: "yh_design_system.page.cash_out_input_account.notice".tr(),
          font: YHFont.regular20,
          color: YHColor.textDefault,
        ),
        const SizedBox(height: 4),
        YHText(
          text: "yh_design_system.page.cash_out_input_account.notice_1".tr(),
          font: YHFont.regular18,
          color: YHColor.textDefault,
        ),
        // const SizedBox(height: 4),
        // YHText(
        //   text: " - 현금 출금은 한 번에 1회씩만 진행 가능해요.",
        //   font: YHFont.regular18,
        //   color: YHColor.textDefault,
        // ),
        // const SizedBox(height: 4),
        // YHText(
        //   text: " - 신청 후 환불/취소/변경이 불가능해요.",
        //   font: YHFont.regular18,
        //   color: YHColor.textDefault,
        // ),
        const SizedBox(height: 4),
        YHText(
          text: "yh_design_system.page.cash_out_input_account.notice_2".tr(),
          font: YHFont.regular18,
          color: YHColor.textDefault,
        ),
      ],
    );
  }

  @override
  void dispose() {
    accountController.dispose();
    bankController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
