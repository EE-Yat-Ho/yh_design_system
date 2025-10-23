part of "attend_bloc.dart";

enum AttendType {
  initial,
  loading,
  success,
  failure,
}

final class AttendState {
  final AttendType type;
  final RewardInfo? rewardInfo;
  final bool canAttend;
  final bool enableReddot;

  const AttendState({
    this.type = AttendType.initial,
    this.rewardInfo,
    this.canAttend = false,
    this.enableReddot = true,
  });

  AttendState copyWith({
    AttendType? type,
    RewardInfo? rewardInfo,
    bool? canAttend,
    bool? enableReddot,
  }) {
    return AttendState(
      type: type ?? this.type,
      rewardInfo: rewardInfo ?? this.rewardInfo,
      canAttend: canAttend ?? this.canAttend,
      enableReddot: enableReddot ?? this.enableReddot,
    );
  }
}
