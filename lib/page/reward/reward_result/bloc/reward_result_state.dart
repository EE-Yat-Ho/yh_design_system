part of "reward_result_bloc.dart";

enum RewardResultType {
  initial,
  loading,
  success,
  failure,
}

final class RewardResultState {
  final RewardResultType type;

  const RewardResultState({
    this.type = RewardResultType.initial,
  });

  RewardResultState copyWith({
    RewardResultType? type,
  }) {
    return RewardResultState(
      type: type ?? this.type,
    );
  }
}
