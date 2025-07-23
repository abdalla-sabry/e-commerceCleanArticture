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

class ProductCard extends Equatable {
  final String name;
  final String type;
  final double price;
  final String imageUrl;

  const ProductCard({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, type, price, imageUrl];
}
