import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/tournaments_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'tournaments_state.dart';

class TournamentsCubit extends Cubit<TournamentsState> {
  TournamentsCubit() : super(TournamentsInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> loadTournaments(String email, int gameid) async {
    try {
      emit(TournamentsLoading());
      final tournamentspageData =
          await _apiClient.tournamentpage(email, gameid);
      emit(TournamentsLoaded(tournamentspageData));
    } on Exception {
      emit(TournamentsFailed());
    }
  }

  Future<void> refresh(String email, int gameid) async {
    final tournamentspageData = await _apiClient.tournamentpage(email, gameid);
    emit(TournamentsLoaded(tournamentspageData));
  }
}
