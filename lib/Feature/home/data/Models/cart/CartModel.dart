class ProductCardModel {
  final String name;
  final String type;
  final double price;
  final String imageUrl;

  ProductCardModel({
    required this.name,
    required this.type,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'price': price,
      'image': imageUrl,
    };
  }

  factory ProductCardModel.fromMap(Map<String, dynamic> map) {
    return ProductCardModel(
      name: map['name'],
      type: map['type'],
      price: (map['price'] as num).toDouble(),
      imageUrl: map['image'],
    );
  }
}
