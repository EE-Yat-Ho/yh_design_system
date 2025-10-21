part of "attend_bloc.dart";

abstract class AttendEvent {
  const AttendEvent();
}

class InitAttend extends AttendEvent {}

class AttendDidTap extends AttendEvent {}
