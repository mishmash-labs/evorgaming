import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'jointournament_state.dart';

class JointournamentCubit extends Cubit<JointournamentState> {
  JointournamentCubit() : super(JointournamentInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> jointournament(
      Map<String, dynamic> data, String tournamentType) async {
    emit(JointournamentJoining());
    var responseData;
    if (tournamentType == "SOLO")
      responseData = await _apiClient.joinsolotournament(data);
    else if (tournamentType == "DUO")
      responseData = await _apiClient.joinduotournament(data);
    else
      responseData = await _apiClient.joinsquadtournament(data);

    if (responseData.code == "200") {
      emit(JointournamentJoined(responseData));
    } else {
      emit(JointournamentFailed(responseData));
    }
  }
}
