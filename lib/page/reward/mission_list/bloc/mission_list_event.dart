part of "mission_list_bloc.dart";

abstract class MissionListEvent {
  const MissionListEvent();
}

final class InitMissionList extends MissionListEvent {}

final class UpdateRewardInfo extends MissionListEvent {
  final RewardInfo rewardInfo;
  UpdateRewardInfo(this.rewardInfo);
}
