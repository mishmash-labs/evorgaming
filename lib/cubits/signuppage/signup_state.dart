part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupFailed extends SignupState {
  SignupFailed(this.data);

  final GenericMessageModel data;
}

class SignupSuccess extends SignupState {
  SignupSuccess(this.data);

  final GenericMessageModel data;
}
