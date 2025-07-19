import 'package:equatable/equatable.dart';

import '../catigory/catigory.dart';

class ProductEntites  extends Equatable{
  final String id;
  final String name;
  final String description;
  final List<PriceTag> priceTags;
  final List<CategoryEntites> categories;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductEntites({
    required this.id,
    required this.name,
    required this.description,
    required this.priceTags,
    required this.categories,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,name,priceTags,description,priceTags,categories,images,createdAt,updatedAt
  ];

}

class PriceTag {
  final String id;
  final String name;
  final double price;

  PriceTag({
    required this.id,
    required this.name,
    required this.price,
  });

}

