import "package:bloc/bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_util/common/constants.dart";
import "package:yh_util/data/repository/yh_user_repository.dart";
import "package:yh_util/domain/entities/yh_user.dart";
import "package:yh_design_system/router.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
part "cash_out_event.dart";
part "cash_out_state.dart";

final class CashOutBloc extends Bloc<CashOutEvent, CashOutState> {
  final YHUserRepository _yhUserRepository;
  CashOutBloc(this._yhUserRepository) : super(const CashOutState()) {
    on<InitCashOut>((event, emit) async {
      final user = await _yhUserRepository.localMe();
      _checkAndUpdateCanCashOut(user, emit);
    });

    on<CashOutDidTap>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final localUser = await _yhUserRepository.localMe();
        final remoteUser = await _yhUserRepository.remoteUser(localUser.id);
        await _yhUserRepository.createLocalUser(remoteUser.copyWith(me: true));

        final canCashOut = _checkAndUpdateCanCashOut(remoteUser, emit);

        if (canCashOut) {
          navigatorKey.currentContext!
              .pushNamed(YHRouteNames.cashOutInputAccount);
        }
      } finally {
        YHIndicator.hide();
      }
    });

    on<PurchasePremiumDidTap>((event, emit) async {
      final user = state.user;
      if (user == null || user.point < event.point) return;

      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final now = DateTime.now();
        final currentEndDate = user.premiumEndDate;
        final baseDate =
            (currentEndDate != null && currentEndDate.isAfter(now))
                ? currentEndDate
                : now;
        final newEndDate = baseDate.add(Duration(days: event.days));

        final updatedUser = user.copyWith(
          point: user.point - event.point,
          premiumEndDate: newEndDate,
          monthCount: event.days == 30 ? user.monthCount + 1 : user.monthCount,
          yearCount: event.days == 365 ? user.yearCount + 1 : user.yearCount,
          totalSpent: user.totalSpent + event.point,
        );

        await _yhUserRepository.createRemoteUser(updatedUser);
        await _yhUserRepository.createLocalUser(updatedUser.copyWith(me: true));

        emit(state.copyWith(user: updatedUser));
      } finally {
        YHIndicator.hide();
      }
    });
  }

  bool _checkAndUpdateCanCashOut(YHUser user, emit) {
    final canCashOut = user.point >= YHUtilConstants.rewardCashOutAmount;
    emit(state.copyWith(
        type: CashOutType.success,
        user: user.copyWith(me: true),
        canCashOut: canCashOut));
    return canCashOut;
  }
}
