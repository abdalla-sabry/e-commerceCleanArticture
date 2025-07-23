part of 'remove_card_items_cubit.dart';

@immutable
abstract class RemoveCardItemsState {}

 class RemoveCardItemsInitial extends RemoveCardItemsState {}
 class RemoveCardItemsLoading extends RemoveCardItemsState {}
 class RemoveCardItemsSuccess extends RemoveCardItemsState {
  String massage;
  RemoveCardItemsSuccess({required this.massage});
 }
 class RemoveCardItemsFailure extends RemoveCardItemsState {
   String error;
   RemoveCardItemsFailure({required this.error});
 }
