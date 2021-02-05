import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../repository/api_client.dart';

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
