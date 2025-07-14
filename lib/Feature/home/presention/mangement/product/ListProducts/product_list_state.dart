part of 'product_list_cubit.dart';

@immutable
abstract class ProductListState {}

 class ProductListInitial extends ProductListState {}
 class ProductListLoading extends ProductListState {}
 class ProductListSuccess extends ProductListState {
 final List<ProductEntites>productList;

  ProductListSuccess({required this.productList});
 }
 class ProductListFailer extends ProductListState {
 final String error;

  ProductListFailer({required this.error});

 }
