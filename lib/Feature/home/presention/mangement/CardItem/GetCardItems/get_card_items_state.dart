part of 'get_card_items_cubit.dart';

@immutable
abstract class GetCardItemsState {}

 class GetCardItemsInitial extends GetCardItemsState {}
 class GetCardItemsLoading extends GetCardItemsState {

 }
 class GetCardItemsSuccess extends GetCardItemsState {
  List<ProductCardModel> productCardList;
  GetCardItemsSuccess({required
  this.productCardList});
 }
 class GetCardItemsFailure extends GetCardItemsState {
  String error;
  GetCardItemsFailure({required this.error});
 }
