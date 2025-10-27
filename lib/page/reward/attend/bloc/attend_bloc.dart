import "package:bloc/bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/di.dart";
import "package:yh_design_system/router.dart";
import "package:yh_util/data/database/shared_preference/shared_preference.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
import "package:yh_util/date_service.dart";
import "package:yh_util/domain/entities/reward_type.dart";
import "package:yh_util/domain/usecases/reward_earn_usecase.dart";

part "attend_event.dart";
part "attend_state.dart";

final class AttendBloc extends Bloc<AttendEvent, AttendState> {
  final RewardInfoRepository _rewardInfoRepository =
      getIt<RewardInfoRepository>();
  final SPService _spService = getIt<SPService>();
  final RewardEarnUseCase _rewardEarnUseCase = getIt<RewardEarnUseCase>();

  AttendBloc() : super(const AttendState()) {
    on<InitAttend>((event, emit) async {
      final rewardInfo = _rewardInfoRepository.lastRewardInfo;
      _checkAndUpdateCanAttend(rewardInfo, emit);

      final enableReddot =
          await _spService.getBool(RewardSPKey.enableAttendReddot);
      emit(state.copyWith(enableReddot: enableReddot ?? true));
    });

    on<AttendDidTap>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        await _rewardEarnUseCase.call(rewardType: RewardType.ATTEND);

        navigatorKey.currentContext!.pop();
        navigatorKey.currentContext!.pushNamed(
          YHRouteNames.rewardResult,
          extra: RewardType.ATTEND.rewardPoint,
        );
      } finally {
        YHIndicator.hide();
      }
    });

    on<ToggleReddot>((event, emit) async {
      final enableReddot = state.enableReddot;
      await _spService.setBool(RewardSPKey.enableAttendReddot, !enableReddot);
      emit(state.copyWith(enableReddot: !enableReddot));
    });
  }

  bool _checkAndUpdateCanAttend(RewardInfo rewardInfo, emit) {
    final attendDate = rewardInfo.attendDate;
    bool canAttend = false;
    canAttend = DateService.isBeforeToday(attendDate);

    emit(state.copyWith(
      type: AttendType.loading,
      rewardInfo: rewardInfo,
      canAttend: canAttend,
    ));

    return canAttend;
  }
}
