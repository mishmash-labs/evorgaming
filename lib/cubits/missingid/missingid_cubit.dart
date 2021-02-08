import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'missingid_state.dart';

class MissingidCubit extends Cubit<MissingidState> {
  MissingidCubit() : super(MissingidInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> updateid(Map<String, dynamic> data) async {
    emit(MissingidSubmitting());
    final response = await _apiClient.addcharacterid(data);
    if (response.code == "200")
      emit(MissingidSubmitted(response));
    else
      emit(MissingidFailed(response));
  }
}
