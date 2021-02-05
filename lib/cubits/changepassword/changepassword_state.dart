part of 'changepassword_cubit.dart';

@immutable
abstract class ChangepasswordState {}

class ChangepasswordInitial extends ChangepasswordState {}

class ChangepasswordSubmitting extends ChangepasswordState {}

class ChangepasswordSubmitted extends ChangepasswordState {
  ChangepasswordSubmitted(this.data);

  final GenericMessageModel data;
}

class ChangepasswordFailed extends ChangepasswordState {
  final String message;

  ChangepasswordFailed(this.message);
}
