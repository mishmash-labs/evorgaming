import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../repository/api_client.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final loginData = await _apiClient.login(email, password);
    if (loginData.code == "200")
      emit(LoginSuccess(loginData));
    else
      emit(LoginFailed(loginData));
  }
}
