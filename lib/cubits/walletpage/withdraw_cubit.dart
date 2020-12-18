import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../models/paymentmethods_model.dart';
import '../../repository/api_client.dart';

part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  WithdrawCubit() : super(WithdrawInitial());

  final ApiClient _apiClient = ApiClient();
  var paymentMethods;

  Future<void> getPaymentMethods(String email) async {
    emit(WithdrawLoading());
    final paymentData = await _apiClient.getpaymentmethods(email);
    paymentMethods = paymentData;
    emit(WithdrawLoaded(paymentData));
  }

  Future<void> submitRequest(Map<String, dynamic> data) async {
    emit(WithdrawLoading());
    final paymentData = await _apiClient.submitwithdrawlrequest(data);
    if (paymentData.code == "200") {
      emit(WithdrawSuccess(paymentData, paymentMethods));
    } else {
      emit(WithdrawFailed(paymentData, paymentMethods));
    }
  }
}
