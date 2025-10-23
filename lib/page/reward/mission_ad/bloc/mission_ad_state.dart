part of "mission_ad_bloc.dart";

enum MissionAdType {
  initial,
  loading,
  success,
  failure,
}

final class MissionAdState {
  final MissionAdType type;
  final RewardInfo? rewardInfo;
  final int remainADWatchCount;
  final bool enableReddot;

  const MissionAdState({
    this.type = MissionAdType.initial,
    this.rewardInfo,
    this.remainADWatchCount = 0,
    this.enableReddot = true,
  });

  MissionAdState copyWith({
    MissionAdType? type,
    RewardInfo? rewardInfo,
    int? remainADWatchCount,
    bool? enableReddot,
  }) {
    return MissionAdState(
      type: type ?? this.type,
      rewardInfo: rewardInfo ?? this.rewardInfo,
      remainADWatchCount: remainADWatchCount ?? this.remainADWatchCount,
      enableReddot: enableReddot ?? this.enableReddot,
    );
  }
}
