part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final GenericMessageModel data;

  CheckoutSuccess(this.data);
}

class CheckoutFailed extends CheckoutState {
  final GenericMessageModel data;

  CheckoutFailed(this.data);
}
