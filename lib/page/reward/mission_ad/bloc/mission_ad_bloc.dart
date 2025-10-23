import "package:bloc/bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/di.dart";
import "package:yh_util/data/database/shared_preference/shared_preference.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import "package:yh_util/data/repository/yh_user_repository.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_design_system/router.dart";
import "package:yh_util/firebase/cloud_functions_service.dart";
import "package:yh_util/common/reward_util.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
import "package:yh_util/admob_manager.dart";
part "mission_ad_event.dart";
part "mission_ad_state.dart";

final class MissionAdBloc extends Bloc<MissionAdEvent, MissionAdState> {
  final YHUserRepository _yhUserRepository;
  final RewardInfoRepository _rewardInfoRepository;
  final SPService _spService = getIt<SPService>();

  MissionAdBloc(this._yhUserRepository, this._rewardInfoRepository)
      : super(const MissionAdState()) {
    on<InitMissionAd>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final rewardInfo = _rewardInfoRepository.lastRewardInfo;
        _checkAndUpdateCanWatchAD(rewardInfo, emit);

        final enableReddot =
            await _spService.getBool(SPKey.enableADWatchReddot);
        emit(state.copyWith(enableReddot: enableReddot ?? true));
      } finally {
        YHIndicator.hide();
      }
    });

    on<SeeAdDidTap>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        // 1. 로드되어있지 않다면 로드 후 노출
        if (AdmobManager.instance.rewardedAd == null) {
          await AdmobManager.instance.loadRewardedAd();
        }
        // 2. 광고 닫힐 때 처리
        AdmobManager.instance.rewardOnDismiss = (earnedReward) {
          // 광고 보상 획득 시 미션 완료 처리
          if (earnedReward) add(EarnedReward());
          // 광고 닫혔으니 다시 로드 시도
          AdmobManager.instance.loadRewardedAd();
        };
        // 광고 노출
        AdmobManager.instance.showRewardedAd();
        emit(state.copyWith(type: MissionAdType.loading));
      } finally {
        YHIndicator.hide();
      }
    });

    on<EarnedReward>((event, emit) async {
      const reward = 5;
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        // 리워드 정보 수정
        final rewardInfo = _rewardInfoRepository.lastRewardInfo;
        final newLastThreeADDate = rewardInfo.lastThreeADDate;
        newLastThreeADDate.add(DateTime.now());
        newLastThreeADDate.removeAt(0);

        final newRewardInfo =
            rewardInfo.copyWith(lastThreeADDate: newLastThreeADDate);
        await _rewardInfoRepository.createRemoteRewardInfo(newRewardInfo);

        // 유저 정보 수정 (포인트 추가)
        final localUser = await _yhUserRepository.localMe();
        final remoteUser = await _yhUserRepository.remoteUser(localUser.id);
        final newUser = remoteUser.copyWith(
          point: remoteUser.point + reward,
          me: true,
        );

        // 포인트는 굳이 파트너한테 동기화할 필요 없음
        await _yhUserRepository.createRemoteUser(newUser);
        await _yhUserRepository.createLocalUser(newUser);

        // 광고 시청 알림
        await CloudFunctionsService.instance
            .adWatched(userId: localUser.id, email: localUser.email);

        navigatorKey.currentContext!.pop();
        navigatorKey.currentContext!
            .pushNamed(YHRouteNames.rewardResult, extra: reward);
      } finally {
        YHIndicator.hide();
      }
    });

    on<ToggleReddot>((event, emit) async {
      final enableReddot = state.enableReddot;
      await _spService.setBool(SPKey.enableADWatchReddot, !enableReddot);
      emit(state.copyWith(enableReddot: !enableReddot));
    });
  }

  void _checkAndUpdateCanWatchAD(RewardInfo rewardInfo, Emitter emit) {
    emit(state.copyWith(
      type: MissionAdType.loading,
      remainADWatchCount: RewardUtil.remainADWatchCount(rewardInfo),
    ));
  }
}
