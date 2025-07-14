import 'package:e_commerce_clean_arcitecture/Feature/home/domain/entities/product/productEntites.dart';
import '../../../domain/entities/catigory/catigory.dart';

class ProductModel extends ProductEntites {
   ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.priceTags,
    required super.categories,
    required super.images,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      priceTags: (json['priceTags'] as List<dynamic>)
          .map((x) => PriceTagModel.fromJson(x as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((x) => CategoryModel.fromJson(x as Map<String, dynamic>))
          .toList(),
      images: List<String>.from(json['images'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'description': description,
    'priceTags': priceTags.map((e) => (e as PriceTagModel).toJson()).toList(),
    'categories': categories.map((e) => (e as CategoryModel).toJson()).toList(),
    'images': images,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class PriceTagModel extends PriceTag {
   PriceTagModel({
    required super.id,
    required super.name,
    required super.price,
  });

  factory PriceTagModel.fromJson(Map<String, dynamic> json) {
    return PriceTagModel(
      id: json['_id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'price': price,
  };
}

class CategoryModel extends Category {
   CategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'image': image,
  };
}