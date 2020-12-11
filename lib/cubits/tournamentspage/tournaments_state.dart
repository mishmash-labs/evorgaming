part of 'tournaments_cubit.dart';

@immutable
abstract class TournamentsState {}

class TournamentsInitial extends TournamentsState {}

class TournamentsLoading extends TournamentsState {}

class TournamentsFailed extends TournamentsState {}

class TournamentsLoaded extends TournamentsState {
  TournamentsLoaded(this.tournamentPageModel);

  final TournamentPageModel tournamentPageModel;
}
