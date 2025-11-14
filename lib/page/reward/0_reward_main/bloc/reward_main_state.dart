part of "reward_main_bloc.dart";

final class RewardMainState {
  final YHUser? user;
  final bool canAttend;
  final bool canWatchAD;
  final bool canNemoStudy;
  final bool showAttendRedDot;
  final bool showWatchADRedDot;
  final bool showNemoStudyRedDot;
  final int remainAttendCash;
  final int remainWatchADCash;
  final int remainNemoStudyCash;
  const RewardMainState({
    this.user,
    this.canAttend = false,
    this.canWatchAD = false,
    this.canNemoStudy = false,
    this.showAttendRedDot = false,
    this.showWatchADRedDot = false,
    this.showNemoStudyRedDot = false,
    this.remainAttendCash = 0,
    this.remainWatchADCash = 0,
    this.remainNemoStudyCash = 0,
  });

  RewardMainState copyWith({
    YHUser? user,
    bool? canAttend,
    bool? canWatchAD,
    bool? canNemoStudy,
    bool? showAttendRedDot,
    bool? showWatchADRedDot,
    bool? showNemoStudyRedDot,
    int? remainAttendCash,
    int? remainWatchADCash,
    int? remainNemoStudyCash,
  }) {
    return RewardMainState(
      user: user ?? this.user,
      canAttend: canAttend ?? this.canAttend,
      canWatchAD: canWatchAD ?? this.canWatchAD,
      canNemoStudy: canNemoStudy ?? this.canNemoStudy,
      showAttendRedDot: showAttendRedDot ?? this.showAttendRedDot,
      showWatchADRedDot: showWatchADRedDot ?? this.showWatchADRedDot,
      showNemoStudyRedDot: showNemoStudyRedDot ?? this.showNemoStudyRedDot,
      remainAttendCash: remainAttendCash ?? this.remainAttendCash,
      remainWatchADCash: remainWatchADCash ?? this.remainWatchADCash,
      remainNemoStudyCash: remainNemoStudyCash ?? this.remainNemoStudyCash,
    );
  }
}
