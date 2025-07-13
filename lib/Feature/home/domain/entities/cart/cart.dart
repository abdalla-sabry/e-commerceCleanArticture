import 'package:equatable/equatable.dart';

import '../product/product.dart';

class ProductItem extends Equatable {
  final String id;
  final Product product;
  final PriceTag priceTag;

  const ProductItem({
    required this.id,
    required this.product,
    required this.priceTag,
  });

  @override
  List<Object?> get props => [id, product, priceTag];
}
