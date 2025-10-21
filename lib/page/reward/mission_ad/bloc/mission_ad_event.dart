part of "mission_ad_bloc.dart";

abstract class MissionAdEvent {
  const MissionAdEvent();
}

final class InitMissionAd extends MissionAdEvent {}

final class SeeAdDidTap extends MissionAdEvent {}

final class EarnedReward extends MissionAdEvent {}
