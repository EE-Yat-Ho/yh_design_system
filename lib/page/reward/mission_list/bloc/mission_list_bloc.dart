import "package:bloc/bloc.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_util/common/reward_util.dart";
import "dart:async";
part "mission_list_event.dart";
part "mission_list_state.dart";

final class MissionListBloc extends Bloc<MissionListEvent, MissionListState> {
  final RewardInfoRepository _rewardInfoRepository;

  StreamSubscription<RewardInfo>? _rewardInfoSubscription;

  @override
  Future<void> close() {
    _rewardInfoSubscription?.cancel();
    return super.close();
  }

  MissionListBloc(this._rewardInfoRepository)
      : super(const MissionListState()) {
    on<InitMissionList>((event, emit) async {
      _rewardInfoSubscription =
          _rewardInfoRepository.rewardInfoStream.listen((rewardInfo) {
        add(UpdateRewardInfo(rewardInfo));
      });
      add(UpdateRewardInfo(_rewardInfoRepository.lastRewardInfo));
    });

    on<UpdateRewardInfo>((event, emit) async {
      emit(state.copyWith(
        canAttend: RewardUtil.canAttend(event.rewardInfo),
        canWatchAD: RewardUtil.canADWatch(event.rewardInfo),
      ));
    });
  }
}
