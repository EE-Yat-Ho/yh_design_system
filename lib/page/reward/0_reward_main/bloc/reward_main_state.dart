part of "reward_main_bloc.dart";

enum RewardMainType {
  initial,
  loading,
  success,
  failure,
}

final class RewardMainState {
  final RewardMainType type;
  final YHUser? user;
  final bool showAttendRedDot;
  final bool showWatchADRedDot;
  final bool showNemoStudyRedDot;
  const RewardMainState({
    this.type = RewardMainType.initial,
    this.user,
    this.showAttendRedDot = false,
    this.showWatchADRedDot = false,
    this.showNemoStudyRedDot = false,
  });

  RewardMainState copyWith({
    RewardMainType? type,
    YHUser? user,
    bool? showAttendRedDot,
    bool? showWatchADRedDot,
    bool? showNemoStudyRedDot,
  }) {
    return RewardMainState(
      type: type ?? this.type,
      user: user ?? this.user,
      showAttendRedDot: showAttendRedDot ?? this.showAttendRedDot,
      showWatchADRedDot: showWatchADRedDot ?? this.showWatchADRedDot,
      showNemoStudyRedDot: showNemoStudyRedDot ?? this.showNemoStudyRedDot,
    );
  }
}
