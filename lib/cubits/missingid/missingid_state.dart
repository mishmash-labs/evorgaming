part of 'missingid_cubit.dart';

@immutable
abstract class MissingidState {}

class MissingidInitial extends MissingidState {}

class MissingidSubmitting extends MissingidState {}

class MissingidSubmitted extends MissingidState {
  final GenericMessageModel data;

  MissingidSubmitted(this.data);
}

class MissingidFailed extends MissingidState {
  final GenericMessageModel data;

  MissingidFailed(this.data);
}
