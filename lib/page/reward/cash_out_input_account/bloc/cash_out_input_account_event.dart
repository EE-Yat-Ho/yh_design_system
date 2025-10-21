part of "cash_out_input_account_bloc.dart";

abstract class CashOutInputAccountEvent {
  const CashOutInputAccountEvent();
}

final class InitCashOutInputAccount extends CashOutInputAccountEvent {}

final class CashOutOnTap extends CashOutInputAccountEvent {
  final String account;
  final String name;
  final String bank;
  const CashOutOnTap(
      {required this.account, required this.name, required this.bank});
}
