import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genericmessage_model.dart';
import '../../repository/api_client.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ApiClient _apiClient = ApiClient();

  Future<void> submitRequest(Map<String, dynamic> data) async {
    emit(ProfileUpdating());
    final profileData = await _apiClient.updateprofile(data);
    if (profileData.code == "200") {
      emit(ProfileUpdated(profileData));
    } else {
      emit(ProfileFailed(profileData));
    }
  }
}
