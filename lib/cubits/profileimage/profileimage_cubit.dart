import 'package:bloc/bloc.dart';
import 'package:evorgaming/models/genericmessage_model.dart';
import 'package:evorgaming/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'profileimage_state.dart';

class ProfileimageCubit extends Cubit<ProfileimageState> {
  ProfileimageCubit() : super(ProfileimageInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> uploadimage(
      String email, String filePath, String fileName) async {
    emit(ProfileimageUpdating());
    final profileData =
        await _apiClient.profileimage(email, filePath, fileName);
    if (profileData.code == "200") {
      emit(ProfileimageUpdated(profileData));
    } else {
      emit(ProfileimageFailed());
    }
  }
}
