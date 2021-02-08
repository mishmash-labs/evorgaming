import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/mytournaments_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'mytournaments_state.dart';

class MytournamentsCubit extends Cubit<MytournamentsState> {
  MytournamentsCubit() : super(MytournamentsInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> loadMyTournaments(String email) async {
    try {
      emit(MyTournamentsLoading());
      final tournamentspageData = await _apiClient.mytournaments(email);
      emit(MyTournamentsLoaded(tournamentspageData));
    } on Exception {
      emit(MyTournamentsFailed());
    }
  }

  Future<void> refresh(String email) async {
    final tournamentspageData = await _apiClient.mytournaments(email);
    emit(MyTournamentsLoaded(tournamentspageData));
  }
}
