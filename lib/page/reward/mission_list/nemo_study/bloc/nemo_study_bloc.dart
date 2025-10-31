import "package:bloc/bloc.dart";
import "package:yh_design_system/di.dart";
import "package:yh_util/data/database/shared_preference/shared_preference.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_design_system/router.dart";
import "package:yh_util/common/reward_util.dart";
import "package:yh_design_system/organisms/indicator/yh_indicator.dart";
part "nemo_study_event.dart";
part "nemo_study_state.dart";

final class NemoStudyBloc extends Bloc<NemoStudyEvent, NemoStudyState> {
  final RewardInfoRepository _rewardInfoRepository =
      getIt<RewardInfoRepository>();
  final SPService _spService = getIt<SPService>();

  NemoStudyBloc() : super(const NemoStudyState()) {
    on<InitNemoStudy>((event, emit) async {
      YHIndicator.show(context: navigatorKey.currentContext!);
      try {
        final rewardInfo = _rewardInfoRepository.lastRewardInfo;
        _checkAndUpdateCanNemoStudy(rewardInfo, emit);

        final enableReddot =
            await _spService.getBool(RewardSPKey.enableADWatchReddot);
        emit(state.copyWith(enableReddot: enableReddot ?? true));
      } finally {
        YHIndicator.hide();
      }
    });

    on<NemoStudyDidTap>((event, emit) async {
      nemoStudyMissionRouteHandler();
    });

    on<ToggleReddot>((event, emit) async {
      final enableReddot = state.enableReddot;
      await _spService.setBool(
          RewardSPKey.enableNemoStudyReddot, !enableReddot);
      emit(state.copyWith(enableReddot: !enableReddot));
    });
  }

  void _checkAndUpdateCanNemoStudy(RewardInfo rewardInfo, Emitter emit) {
    final remainNemoStudyCount = RewardUtil.remainNemoStudyCount(rewardInfo);
    emit(state.copyWith(
      rewardInfo: rewardInfo,
      remainNemoStudyCount: remainNemoStudyCount,
    ));
  }
}
