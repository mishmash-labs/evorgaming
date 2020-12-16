part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemAdding extends ItemState {}

class ItemAdded extends ItemState {
  ItemAdded(this.data);

  final GenericMessageModel data;
}

class ItemFailed extends ItemState {
  ItemFailed(this.data);

  final GenericMessageModel data;
}
