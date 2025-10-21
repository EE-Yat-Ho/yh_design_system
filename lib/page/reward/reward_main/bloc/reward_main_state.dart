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
  final bool showRedDot;
  const RewardMainState({
    this.type = RewardMainType.initial,
    this.user,
    this.showRedDot = false,
  });

  RewardMainState copyWith({
    RewardMainType? type,
    YHUser? user,
    bool? showRedDot,
  }) {
    return RewardMainState(
      type: type ?? this.type,
      user: user ?? this.user,
      showRedDot: showRedDot ?? this.showRedDot,
    );
  }
}
