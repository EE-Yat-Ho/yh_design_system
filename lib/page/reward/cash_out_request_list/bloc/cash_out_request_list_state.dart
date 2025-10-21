part of "cash_out_request_list_bloc.dart";

enum CashOutRequestListType {
  initial,
  loading,
  success,
  failure,
}

final class CashOutRequestListState {
  final CashOutRequestListType type;
  final List<CashOutRequest> cashOutRequests;
  const CashOutRequestListState({
    this.type = CashOutRequestListType.initial,
    this.cashOutRequests = const [],
  });

  CashOutRequestListState copyWith({
    CashOutRequestListType? type,
    List<CashOutRequest>? cashOutRequests,
  }) {
    return CashOutRequestListState(
      type: type ?? this.type,
      cashOutRequests: cashOutRequests ?? this.cashOutRequests,
    );
  }
}
