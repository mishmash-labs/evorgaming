part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailed extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.homepageData);

  final HomePageModel homepageData;
}
