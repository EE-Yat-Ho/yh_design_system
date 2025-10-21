import "package:bloc/bloc.dart";
import "package:yh_util/data/repository/cash_out_request_repository.dart";
import "package:yh_util/data/repository/yh_user_repository.dart";
import "package:yh_util/domain/entities/cash_out_request.dart";
import "package:yh_design_system/router.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
part "cash_out_request_list_event.dart";
part "cash_out_request_list_state.dart";

final class CashOutRequestListBloc
    extends Bloc<CashOutRequestListEvent, CashOutRequestListState> {
  final CashOutRequestRepository _cashOutRequestRepository;
  final YHUserRepository _yhUserRepository;

  CashOutRequestListBloc(this._cashOutRequestRepository, this._yhUserRepository)
      : super(const CashOutRequestListState()) {
    on<InitCashOutRequestList>((event, emit) async {
      emit(state.copyWith(type: CashOutRequestListType.loading));
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final localUser = await _yhUserRepository.localMe();
        final cashOutRequests =
            await _cashOutRequestRepository.remoteCashOutRequests(localUser.id);
        emit(state.copyWith(
            type: CashOutRequestListType.success,
            cashOutRequests: cashOutRequests));
      } catch (e) {
        emit(state.copyWith(type: CashOutRequestListType.failure));
      } finally {
        YHIndicator.hide();
      }
    });
  }
}
