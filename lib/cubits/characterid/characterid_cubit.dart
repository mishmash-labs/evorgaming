import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:meta/meta.dart';

import '../../models/account_model.dart';
import '../../repository/api_client.dart';

part 'characterid_state.dart';

class CharacteridCubit extends Cubit<CharacteridState> {
  CharacteridCubit(this.characterId) : super(CharacteridInitial());

  List<CharacterId> characterId;
  final ApiClient _apiClient = ApiClient();

  Future<void> updateid(String email, Map<String, dynamic> data) async {
    emit(CharacteridAdding());
    final responseData = await _apiClient.addcharacterid(data);
    final AccountModel accountData = await _apiClient.accountpage(email);
    characterId = accountData.characterId;
    if (responseData.code == "200")
      emit(CharacteridAdded(characterId, responseData));
    else
      emit(CharacteridFailed(responseData, characterId));
  }
}
