part of "reward_main_bloc.dart";

final class RewardMainState {
  final YHUser? user;
  final bool canAttend;
  final bool canWatchAD;
  final bool canNemoStudy;
  final bool showAttendRedDot;
  final bool showWatchADRedDot;
  final bool showNemoStudyRedDot;
  const RewardMainState({
    this.user,
    this.canAttend = false,
    this.canWatchAD = false,
    this.canNemoStudy = false,
    this.showAttendRedDot = false,
    this.showWatchADRedDot = false,
    this.showNemoStudyRedDot = false,
  });

  RewardMainState copyWith({
    YHUser? user,
    bool? canAttend,
    bool? canWatchAD,
    bool? canNemoStudy,
    bool? showAttendRedDot,
    bool? showWatchADRedDot,
    bool? showNemoStudyRedDot,
  }) {
    return RewardMainState(
      user: user ?? this.user,
      canAttend: canAttend ?? this.canAttend,
      canWatchAD: canWatchAD ?? this.canWatchAD,
      canNemoStudy: canNemoStudy ?? this.canNemoStudy,
      showAttendRedDot: showAttendRedDot ?? this.showAttendRedDot,
      showWatchADRedDot: showWatchADRedDot ?? this.showWatchADRedDot,
      showNemoStudyRedDot: showNemoStudyRedDot ?? this.showNemoStudyRedDot,
    );
  }
}
