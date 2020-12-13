import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> register(Map<String, dynamic> data) async {
    emit(SignupLoading());
    final loginData = await _apiClient.register(data);
    if (loginData.code == "200")
      emit(SignupSuccess(loginData));
    else
      emit(SignupFailed(loginData));
  }
}
