part of "attend_bloc.dart";

abstract class AttendEvent {
  const AttendEvent();
}

final class InitAttend extends AttendEvent {}

final class AttendDidTap extends AttendEvent {}

final class ToggleReddot extends AttendEvent {}
