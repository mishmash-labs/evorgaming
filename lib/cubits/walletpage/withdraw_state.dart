part of 'withdraw_cubit.dart';

@immutable
abstract class WithdrawState {}

class WithdrawInitial extends WithdrawState {}

class WithdrawLoading extends WithdrawState {}

class WithdrawLoaded extends WithdrawState {
  WithdrawLoaded(this.paymentData);

  final PaymentMethodsModel paymentData;
}

class WithdrawSuccess extends WithdrawState {
  WithdrawSuccess(this.data, this.paymentData);

  final GenericMessageModel data;
  final PaymentMethodsModel paymentData;
}

class WithdrawFailed extends WithdrawState {
  WithdrawFailed(this.data, this.paymentData);

  final GenericMessageModel data;
  final PaymentMethodsModel paymentData;
}
