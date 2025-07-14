import 'package:equatable/equatable.dart';

import '../product/productEntites.dart';

class ProductItem extends Equatable {
  final String id;
  final ProductEntites product;
  final PriceTag priceTag;

  const ProductItem({
    required this.id,
    required this.product,
    required this.priceTag,
  });

  @override
  List<Object?> get props => [id, product, priceTag];
}
