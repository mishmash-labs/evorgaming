part of 'characterid_cubit.dart';

@immutable
abstract class CharacteridState {}

class CharacteridInitial extends CharacteridState {}

class CharacteridAdding extends CharacteridState {}

class CharacteridAdded extends CharacteridState {
  final List<CharacterId> characterId;
  final GenericMessageModel data;

  CharacteridAdded(this.characterId, this.data);
}

class CharacteridFailed extends CharacteridState {
  final GenericMessageModel data;
  final List<CharacterId> characterId;
  CharacteridFailed(this.data, this.characterId);
}
