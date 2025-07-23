part of 'add_card_items_cubit.dart';

@immutable
abstract class AddCardItemsState {}

 class AddCardItemsInitial extends AddCardItemsState {}
 class AddCardItemsLoading extends AddCardItemsState {}
 class AddCardItemsSuccess extends AddCardItemsState {
  String massage;
  AddCardItemsSuccess({required this.massage});
 }
 class AddCardItemsFailure extends AddCardItemsState {
  String? error;
  AddCardItemsFailure({ this.error});
 }
