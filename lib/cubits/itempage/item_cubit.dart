import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../repository/api_client.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> addToCart(
      String email, int userID, int productID, int qty) async {
    emit(ItemAdding());
    final itemData = await _apiClient.addtocart(email, userID, productID, qty);
    if (itemData.code == "200")
      emit(ItemAdded(itemData));
    else
      emit(ItemFailed(itemData));
  }
}
