part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopFailed extends ShopState {}

class ShopLoaded extends ShopState {
  ShopLoaded(this.shopModel);

  final ShopModel shopModel;
}
