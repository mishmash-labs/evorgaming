part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final GenericMessageModel data;

  ProfileUpdated(this.data);
}

class ProfileFailed extends ProfileState {
  final GenericMessageModel data;

  ProfileFailed(this.data);
}
