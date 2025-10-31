part of "cash_out_input_account_bloc.dart";

enum CashOutInputAccountType {
  initial,
  loading,
  success,
  failure,
}

final class CashOutInputAccountState {
  final CashOutInputAccountType type;
  final YHUser? user;
  final bool canCashOut;
  const CashOutInputAccountState({
    this.type = CashOutInputAccountType.initial,
    this.user,
    this.canCashOut = false,
  });

  CashOutInputAccountState copyWith({
    CashOutInputAccountType? type,
    YHUser? user,
    bool? canCashOut,
  }) {
    return CashOutInputAccountState(
      type: type ?? this.type,
      user: user ?? this.user,
      canCashOut: canCashOut ?? this.canCashOut,
    );
  }
}
