part of "cash_out_bloc.dart";

abstract class CashOutEvent {
  const CashOutEvent();
}

class InitCashOut extends CashOutEvent {}

class CashOutDidTap extends CashOutEvent {}

class PurchasePremiumDidTap extends CashOutEvent {
  final int days;
  final int point;
  const PurchasePremiumDidTap({required this.days, required this.point});
}
