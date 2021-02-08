part of 'mytournaments_cubit.dart';

@immutable
abstract class MytournamentsState {}

class MytournamentsInitial extends MytournamentsState {}

class MyTournamentsLoading extends MytournamentsState {}

class MyTournamentsFailed extends MytournamentsState {}

class MyTournamentsLoaded extends MytournamentsState {
  MyTournamentsLoaded(this.tournamentPageModel);

  final MyTournamentPageModel tournamentPageModel;
}
