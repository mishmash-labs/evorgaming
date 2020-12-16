import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/cartpage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> loadCart(String email) async {
    try {
      emit(CartLoading());
      final cartData = await _apiClient.viewcart(email);
      emit(CartLoaded(cartData));
    } on Exception {
      emit(CartFailed());
    }
  }

  Future<void> refresh(String email) async {
    final cartData = await _apiClient.viewcart(email);
    emit(CartLoaded(cartData));
  }
}
