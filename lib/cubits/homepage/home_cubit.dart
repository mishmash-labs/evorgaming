import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/homepage_model.dart';
import '../../repository/api_client.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> loadHome(String email) async {
    try {
      emit(HomeLoading());
      final homepageData = await _apiClient.homepage(email);
      emit(HomeLoaded(homepageData));
    } on Exception {
      emit(HomeFailed());
    }
  }

  Future<void> refresh(String email) async {
    final homepageData = await _apiClient.homepage(email);
    emit(HomeLoaded(homepageData));
  }
}
