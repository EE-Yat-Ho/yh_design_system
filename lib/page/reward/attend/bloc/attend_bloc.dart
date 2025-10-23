import "package:bloc/bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/di.dart";
import "package:yh_design_system/router.dart";
import "package:yh_util/data/database/shared_preference/shared_preference.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
import "package:yh_util/data/repository/yh_user_repository.dart";
import "package:yh_util/date_service.dart";

part "attend_event.dart";
part "attend_state.dart";

final class AttendBloc extends Bloc<AttendEvent, AttendState> {
  final YHUserRepository _yhUserRepository;
  final RewardInfoRepository _rewardInfoRepository;
  final SPService _spService = getIt<SPService>();

  AttendBloc(this._yhUserRepository, this._rewardInfoRepository)
      : super(const AttendState()) {
    on<InitAttend>((event, emit) async {
      final rewardInfo = _rewardInfoRepository.lastRewardInfo;
      _checkAndUpdateCanAttend(rewardInfo, emit);

      final enableReddot =
          await _spService.getBool(RewardSPKey.enableAttendReddot);
      emit(state.copyWith(enableReddot: enableReddot ?? true));
    });

    on<AttendDidTap>((event, emit) async {
      const reward = 2;
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final localUser = await _yhUserRepository.localMe();
        final rewardInfo =
            await _rewardInfoRepository.remoteRewardInfo(localUser.id);
        final canAttend = _checkAndUpdateCanAttend(rewardInfo, emit);

        if (canAttend) {
          final newRewardInfo = rewardInfo.copyWith(attendDate: DateTime.now());
          await _rewardInfoRepository.createRemoteRewardInfo(newRewardInfo);

          final remoteUser = await _yhUserRepository.remoteUser(localUser.id);
          final newUser = remoteUser.copyWith(
            point: remoteUser.point + reward,
            me: true,
          );

          // 포인트는 굳이 파트너한테 동기화할 필요 없음
          await _yhUserRepository.createRemoteUser(newUser);
          await _yhUserRepository.createLocalUser(newUser);

          navigatorKey.currentContext!.pop();
          navigatorKey.currentContext!
              .pushNamed(YHRouteNames.rewardResult, extra: reward);
        }
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
