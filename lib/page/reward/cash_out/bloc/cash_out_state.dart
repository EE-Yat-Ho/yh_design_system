part of "cash_out_bloc.dart";

enum CashOutType {
  initial,
  loading,
  success,
  failure,
}

final class CashOutState {
  final CashOutType type;
  final YHUser? user;
  final bool canCashOut;

  const CashOutState({
    this.type = CashOutType.initial,
    this.user,
    this.canCashOut = false,
  });

  CashOutState copyWith({
    CashOutType? type,
    YHUser? user,
    bool? canCashOut,
  }) {
    return CashOutState(
      type: type ?? this.type,
      user: user ?? this.user,
      canCashOut: canCashOut ?? this.canCashOut,
    );
  }
}
