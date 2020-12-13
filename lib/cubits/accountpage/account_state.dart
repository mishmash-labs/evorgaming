part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  AccountLoaded(this.data);

  final AccountModel data;
}

class AccountFailed extends AccountState {}
