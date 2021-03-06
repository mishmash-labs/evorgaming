import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../repository/api_client.dart';

part 'profileimage_state.dart';

class ProfileimageCubit extends Cubit<ProfileimageState> {
  ProfileimageCubit() : super(ProfileimageInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> uploadimage(
      String email, String filePath, String fileName, Uint8List webFile) async {
    emit(ProfileimageUpdating());
    final profileData =
        await _apiClient.profileimage(email, filePath, fileName, webFile);
    if (profileData.code == "200") {
      emit(ProfileimageUpdated(profileData));
    } else {
      emit(ProfileimageFailed());
    }
  }
}
