part of 'jointournament_cubit.dart';

@immutable
abstract class JointournamentState {}

class JointournamentInitial extends JointournamentState {}

class JointournamentJoining extends JointournamentState {}

class JointournamentJoined extends JointournamentState {
  JointournamentJoined(this.data);

  final GenericMessageModel data;
}

class JointournamentFailed extends JointournamentState {
  JointournamentFailed(this.data);

  final GenericMessageModel data;
}
