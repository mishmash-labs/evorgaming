part of 'characterid_cubit.dart';

@immutable
abstract class CharacteridState {}

class CharacteridInitial extends CharacteridState {}

class CharacteridAdding extends CharacteridState {}

class CharacteridAdded extends CharacteridState {
  final List<CharacterId> characterId;

  CharacteridAdded(this.characterId);
}

class CharacteridFailed extends CharacteridState {}
