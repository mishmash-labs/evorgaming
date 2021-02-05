import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'changepassword_state.dart';

class ChangepasswordCubit extends Cubit<ChangepasswordState> {
  ChangepasswordCubit() : super(ChangepasswordInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> changepassword(Map<String, dynamic> data) async {
    emit(ChangepasswordSubmitting());
    final response = await _apiClient.changepassword(data);
    if (response.code == "200") {
      emit(ChangepasswordSubmitted(response));
    } else {
      emit(ChangepasswordFailed(response.message));
    }
  }
}
