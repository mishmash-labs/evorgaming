part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cartData;
  final int totalCost;

  CartLoaded(this.cartData, this.totalCost);
}

class CartFailed extends CartState {}
