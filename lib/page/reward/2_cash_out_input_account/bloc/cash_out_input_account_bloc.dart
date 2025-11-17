import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:yh_util/common/constants.dart";
import "package:yh_util/data/repository/update_history/update_history_repository.dart";
import "package:yh_util/data/repository/yh_user_repository.dart";
import "package:yh_util/domain/entities/yh_user.dart";
import "package:yh_design_system/router.dart";
import "package:yh_util/firebase/cloud_functions_service.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";

part "cash_out_input_account_event.dart";
part "cash_out_input_account_state.dart";

final class CashOutInputAccountBloc
    extends Bloc<CashOutInputAccountEvent, CashOutInputAccountState> {
  final YHUserRepository _yhUserRepository;
  final UpdateHistoryRepository _updateHistoryRepository;
  CashOutInputAccountBloc(this._yhUserRepository, this._updateHistoryRepository)
      : super(const CashOutInputAccountState()) {
    on<InitCashOutInputAccount>((event, emit) async {
      emit(state.copyWith(type: CashOutInputAccountType.loading));
    });

    on<CashOutOnTap>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final localUser = await _yhUserRepository.localMe();
        final canCashOut = _checkAndUpdateCanCashOut(localUser, emit);

        if (canCashOut) {
          await CloudFunctionsService.instance.cashOut(
            userId: localUser.id,
            account: event.account,
            name: event.name,
            bank: event.bank,
            email: localUser.email,
            amount: YHUtilConstants.rewardCashOutAmount,
          );
          final remoteUser = await _yhUserRepository.remoteUser(localUser.id);
          final newUser = remoteUser.copyWith(me: true);

          await _yhUserRepository.createRemoteUser(newUser);
          // me는 항상 동기화하기에, 파트너가 있을 경우 파트너한테만 업데이트하면됨
          try {
            final partner = await _yhUserRepository.localPartner();
            await _updateHistoryRepository.updateMe(newUser.id, partner.id);
          } catch (e) {
            debugPrint('🔔🚨 파트너 히스토리 업데이트 실패: $e');
          }
          await _yhUserRepository.createLocalUser(newUser);
          navigatorKey.currentContext!.pop();
          navigatorKey.currentContext!.pop();
          navigatorKey.currentContext!.pushNamed(YHRouteNames.cashOutResult);
        }
      } finally {
        YHIndicator.hide();
      }
    });
  }

  bool _checkAndUpdateCanCashOut(YHUser user, emit) {
    final canCashOut = user.point >= YHUtilConstants.rewardCashOutAmount;
    emit(state.copyWith(
        type: CashOutInputAccountType.success,
        user: user.copyWith(me: true),
        canCashOut: canCashOut));
    return canCashOut;
  }
}
