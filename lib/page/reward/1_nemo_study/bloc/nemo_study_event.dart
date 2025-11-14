part of "nemo_study_bloc.dart";

abstract class NemoStudyEvent {
  const NemoStudyEvent();
}

final class InitNemoStudy extends NemoStudyEvent {}

final class NemoStudyDidTap extends NemoStudyEvent {}

final class ToggleReddot extends NemoStudyEvent {}
