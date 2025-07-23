part of 'totile_prices_cubit.dart';

@immutable
 class TotilePricesState {}

 class TotilePricesAdded extends TotilePricesState {
  int total_product;
  double total_price;
  TotilePricesAdded({required this.total_price,required this.total_product});
 }
 class TotilePricessubtract extends TotilePricesState {
 int total_product;
 double total_price;
 TotilePricessubtract({required this.total_price,required this.total_product});
 }
 class TotilePricesInitial extends TotilePricesState {}
 class TotilePricesFailure extends TotilePricesState {
 String error;
 TotilePricesFailure({required this.error
 });
 }
