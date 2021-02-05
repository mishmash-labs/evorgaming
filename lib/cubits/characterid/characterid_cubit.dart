import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/account_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'characterid_state.dart';

class CharacteridCubit extends Cubit<CharacteridState> {
  CharacteridCubit(this.characterId) : super(CharacteridInitial());

  List<CharacterId> characterId;
  final ApiClient _apiClient = ApiClient();

  Future<void> updateid(String email, Map<String, dynamic> data) async {
    try {
      emit(CharacteridAdding());
      await _apiClient.addcharacterid(data);
      final AccountModel accountData = await _apiClient.accountpage(email);
      characterId = accountData.characterId;
      emit(CharacteridAdded(characterId));
    } on Exception {
      emit(CharacteridFailed());
    }
  }
}