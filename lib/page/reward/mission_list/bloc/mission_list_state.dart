part of "mission_list_bloc.dart";

enum MissionListType {
  initial,
  loading,
  success,
  failure,
}

final class MissionListState {
  final MissionListType type;
  final bool canAttend;
  final bool canWatchAD;

  const MissionListState({
    this.type = MissionListType.initial,
    this.canAttend = false,
    this.canWatchAD = false,
  });

  MissionListState copyWith({
    MissionListType? type,
    bool? canAttend,
    bool? canWatchAD,
  }) {
    return MissionListState(
      type: type ?? this.type,
      canAttend: canAttend ?? this.canAttend,
      canWatchAD: canWatchAD ?? this.canWatchAD,
    );
  }
}
