import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

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
