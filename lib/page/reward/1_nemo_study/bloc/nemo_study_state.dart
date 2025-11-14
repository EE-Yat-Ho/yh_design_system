part of "nemo_study_bloc.dart";

final class NemoStudyState {
  final RewardInfo? rewardInfo;
  final int remainNemoStudyCount;
  final bool enableReddot;

  const NemoStudyState({
    this.rewardInfo,
    this.remainNemoStudyCount = 0,
    this.enableReddot = true,
  });

  NemoStudyState copyWith({
    RewardInfo? rewardInfo,
    int? remainNemoStudyCount,
    bool? enableReddot,
  }) {
    return NemoStudyState(
      rewardInfo: rewardInfo ?? this.rewardInfo,
      remainNemoStudyCount: remainNemoStudyCount ?? this.remainNemoStudyCount,
      enableReddot: enableReddot ?? this.enableReddot,
    );
  }
}
