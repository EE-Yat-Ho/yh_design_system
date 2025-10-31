part of "cash_out_result_bloc.dart";

enum CashOutResultType {
  initial,
  loading,
  success,
  failure,
}

final class CashOutResultState {
  final CashOutResultType type;

  const CashOutResultState({
    this.type = CashOutResultType.initial,
  });

  CashOutResultState copyWith({
    CashOutResultType? type,
  }) {
    return CashOutResultState(
      type: type ?? this.type,
    );
  }
}
