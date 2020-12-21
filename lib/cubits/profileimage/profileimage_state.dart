part of 'profileimage_cubit.dart';

@immutable
abstract class ProfileimageState {}

class ProfileimageInitial extends ProfileimageState {}

class ProfileimageUpdating extends ProfileimageState {}

class ProfileimageUpdated extends ProfileimageState {
  final GenericMessageModel data;

  ProfileimageUpdated(this.data);
}

class ProfileimageFailed extends ProfileimageState {}
