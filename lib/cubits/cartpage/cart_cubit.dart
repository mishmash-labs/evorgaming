import 'package:bloc/bloc.dart';
import '../../models/cartpage_model.dart';
import '../../repository/api_client.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final ApiClient _apiClient = ApiClient();
  int totalCost = 0;

  Future<void> loadCart(String email) async {
    try {
      emit(CartLoading());
      final CartModel cartData = await _apiClient.viewcart(email);
      totalCost = 0;
      for (var item in cartData.message) {
        totalCost = totalCost + (int.parse(item.price) * int.parse(item.qty));
      }
      emit(CartLoaded(cartData, totalCost));
    } on Exception {
      emit(CartFailed());
    }
  }

  Future<void> deleteitem(String email, String itemID) async {
    emit(CartLoading());
    await _apiClient.deletefromcart(email, itemID);
    final cartData = await _apiClient.viewcart(email);
    totalCost = 0;
    for (var item in cartData.message) {
      totalCost = totalCost + (int.parse(item.price) * int.parse(item.qty));
    }
    emit(CartLoaded(cartData, totalCost));
  }

  Future<void> refresh(String email) async {
    final cartData = await _apiClient.viewcart(email);
    totalCost = 0;
    for (var item in cartData.message) {
      totalCost = totalCost + int.parse(item.price);
    }
    emit(CartLoaded(cartData, totalCost));
  }
}
