import 'package:bloc/bloc.dart';
import '../../models/account_model.dart';
import '../../repository/api_client.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> loadAccount(String email) async {
    try {
      emit(AccountLoading());
      final accountData = await _apiClient.accountpage(email);
      emit(AccountLoaded(accountData));
    } on Exception {
      emit(AccountFailed());
    }
  }

  Future<void> refresh(String email) async {
    final accountData = await _apiClient.accountpage(email);
    emit(AccountLoaded(accountData));
  }
}
