import "package:bloc/bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/di.dart";
import "package:yh_util/data/database/shared_preference/shared_preference.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_design_system/router.dart";
import "package:yh_util/domain/entities/reward_type.dart";
import "package:yh_util/domain/usecases/reward_earn_usecase.dart";
import "package:yh_util/common/reward_util.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
import "package:yh_util/admob_manager.dart";
part "mission_ad_event.dart";
part "mission_ad_state.dart";

final class MissionAdBloc extends Bloc<MissionAdEvent, MissionAdState> {
  final RewardInfoRepository _rewardInfoRepository =
      getIt<RewardInfoRepository>();
  final SPService _spService = getIt<SPService>();
  final RewardEarnUseCase _rewardEarnUseCase = getIt<RewardEarnUseCase>();

  MissionAdBloc() : super(const MissionAdState()) {
    on<InitMissionAd>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final rewardInfo = _rewardInfoRepository.lastRewardInfo;
        _checkAndUpdateCanWatchAD(rewardInfo, emit);

        final enableReddot =
            await _spService.getBool(RewardSPKey.enableADWatchReddot);
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
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        await _rewardEarnUseCase.call(rewardType: RewardType.AD_WATCH);

        navigatorKey.currentContext!.pop();
        navigatorKey.currentContext!.pushNamed(
          YHRouteNames.rewardResult,
          extra: RewardType.AD_WATCH.rewardPoint,
        );
      } finally {
        YHIndicator.hide();
      }
    });

    on<ToggleReddot>((event, emit) async {
      final enableReddot = state.enableReddot;
      await _spService.setBool(RewardSPKey.enableADWatchReddot, !enableReddot);
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
