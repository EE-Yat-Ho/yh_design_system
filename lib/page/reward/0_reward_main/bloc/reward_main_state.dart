part of "reward_main_bloc.dart";

final class RewardMainState {
  final YHUser? user;
  final bool showAttendRedDot;
  final bool showWatchADRedDot;
  final bool showNemoStudyRedDot;
  const RewardMainState({
    this.user,
    this.showAttendRedDot = false,
    this.showWatchADRedDot = false,
    this.showNemoStudyRedDot = false,
  });

  RewardMainState copyWith({
    YHUser? user,
    bool? showAttendRedDot,
    bool? showWatchADRedDot,
    bool? showNemoStudyRedDot,
  }) {
    return RewardMainState(
      user: user ?? this.user,
      showAttendRedDot: showAttendRedDot ?? this.showAttendRedDot,
      showWatchADRedDot: showWatchADRedDot ?? this.showWatchADRedDot,
      showNemoStudyRedDot: showNemoStudyRedDot ?? this.showNemoStudyRedDot,
    );
  }
}
