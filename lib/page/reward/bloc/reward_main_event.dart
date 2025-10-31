part of "reward_main_bloc.dart";

sealed class RewardMainEvent {}

final class InitRewardMain extends RewardMainEvent {}

// 유저 정보 업데이트 이벤트
final class _UpdateUser extends RewardMainEvent {
  final YHUser user;
  _UpdateUser(this.user);
}

final class UpdateRewardInfo extends RewardMainEvent {
  final RewardInfo rewardInfo;
  UpdateRewardInfo(this.rewardInfo);
}
