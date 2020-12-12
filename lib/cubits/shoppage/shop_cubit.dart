import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/shoppage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> loadShop(String email) async {
    try {
      emit(ShopLoading());
      final shoppageData = await _apiClient.shoppage(email);
      emit(ShopLoaded(shoppageData));
    } on Exception {
      emit(ShopFailed());
    }
  }

  Future<void> refresh(String email) async {
    final shoppageData = await _apiClient.shoppage(email);
    emit(ShopLoaded(shoppageData));
  }
}