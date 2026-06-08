part of "cash_out_bloc.dart";

abstract class CashOutEvent {
  const CashOutEvent();
}

class InitCashOut extends CashOutEvent {}

class CashOutDidTap extends CashOutEvent {}
