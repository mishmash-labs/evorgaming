import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> checkout(Map<String, dynamic> data) async {
    emit(CheckoutLoading());
    final checkoutResponse = await _apiClient.checkout(data);
    if (checkoutResponse.code == "200") {
      emit(CheckoutSuccess(checkoutResponse));
    } else {
      emit(CheckoutFailed(checkoutResponse));
    }
  }
}
