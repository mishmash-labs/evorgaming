import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/shoppage_model.dart';
import '../../repository/api_client.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  final ApiClient _apiClient = ApiClient();
  var itemCount = 0;

  Future<void> loadShop(String email) async {
    try {
      emit(ShopLoading());
      final ShopModel shoppageData = await _apiClient.shoppage(email);
      itemCount = shoppageData.cartTotalProducts;
      emit(ShopLoaded(shoppageData));
    } on Exception {
      emit(ShopFailed());
    }
  }

  Future<void> refresh(String email) async {
    final shoppageData = await _apiClient.shoppage(email);
    itemCount = shoppageData.cartTotalProducts;
    emit(ShopLoaded(shoppageData));
  }
}
