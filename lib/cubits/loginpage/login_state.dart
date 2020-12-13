part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {
  LoginFailed(this.data);

  final GenericMessageModel data;
}

class LoginSuccess extends LoginState {
  LoginSuccess(this.data);

  final GenericMessageModel data;
}
