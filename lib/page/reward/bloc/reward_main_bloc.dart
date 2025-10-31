import "package:bloc/bloc.dart";
import "package:yh_design_system/di.dart";
import "package:yh_util/data/database/shared_preference/shared_preference.dart";
import "package:yh_util/data/repository/reward_info_repository.dart";
import 'dart:async';
import "package:yh_util/data/repository/yh_user_repository.dart";
import "package:yh_util/domain/entities/yh_user.dart";
import "package:yh_util/domain/entities/reward_info.dart";
import "package:yh_util/common/reward_util.dart";

part "reward_main_event.dart";
part "reward_main_state.dart";

final class RewardMainBloc extends Bloc<RewardMainEvent, RewardMainState> {
  final YHUserRepository _yhUserRepository;
  final RewardInfoRepository _rewardInfoRepository;

  StreamSubscription<YHUser>? _localMeSubscription;
  StreamSubscription<RewardInfo>? _rewardInfoSubscription;
  StreamSubscription<void>? _rewardReddotSubscription;
  final SPService _spService = getIt<SPService>();

  @override
  Future<void> close() {
    _localMeSubscription?.cancel();
    _rewardInfoSubscription?.cancel();
    _rewardReddotSubscription?.cancel();
    return super.close();
  }

  RewardMainBloc(this._yhUserRepository, this._rewardInfoRepository)
      : super(const RewardMainState()) {
    on<InitRewardMain>((event, emit) async {
      // localMe 스트림 구독 시작
      _localMeSubscription = _yhUserRepository.localMeStream.listen((user) {
        add(_UpdateUser(user));
      });
      emit(state.copyWith(user: await _yhUserRepository.localMe()));

      // rewardInfo 스트림 구독 시작
      _rewardInfoSubscription =
          _rewardInfoRepository.rewardInfoStream.listen((rewardInfo) {
        add(UpdateRewardInfo(rewardInfo));
      });

      // rewardReddot 스트림 구독 시작
      _rewardReddotSubscription =
          _spService.stream(RewardSPKey).listen((enableReddot) {
        final rewardInfo = _rewardInfoRepository.lastRewardInfo;
        add(UpdateRewardInfo(rewardInfo));
      });

      add(UpdateRewardInfo(_rewardInfoRepository.lastRewardInfo));
    });

    // 유저 정보 업데이트 이벤트 처리
    on<_UpdateUser>((event, emit) {
      emit(state.copyWith(type: RewardMainType.success, user: event.user));
    });

    // 리워드 정보 업데이트 이벤트 처리
    on<UpdateRewardInfo>((event, emit) async {
      final canShowAnyRedDot =
          await RewardUtil.canShowAnyRedDot(event.rewardInfo, _spService);
      emit(state.copyWith(
        type: RewardMainType.success,
        showRedDot: canShowAnyRedDot,
      ));
    });
  }
}
