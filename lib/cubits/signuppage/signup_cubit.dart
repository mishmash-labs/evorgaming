import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../repository/api_client.dart';

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
