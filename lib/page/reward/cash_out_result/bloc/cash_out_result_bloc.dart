import "package:bloc/bloc.dart";

part "cash_out_result_event.dart";
part "cash_out_result_state.dart";

final class CashOutResultBloc extends Bloc<CashOutResultEvent, CashOutResultState> {
  CashOutResultBloc() : super(const CashOutResultState()) {
    on<InitCashOutResult>((event, emit) async {
      emit(state.copyWith(type: CashOutResultType.loading));
    });
  }
}
