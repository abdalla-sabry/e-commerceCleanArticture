import 'package:equatable/equatable.dart';
import '../../../domain/entities/catigory/catigory.dart';

class Carigorymodel extends CategoryEntites {
  final String id;
  final String name;
  final String image;

  Carigorymodel({
    required this.id,
    required this.name,
    required this.image,
  }) : super(id: id, name: name, image: image);

  // ✅ Factory constructor to create from JSON
  factory Carigorymodel.fromJson(Map<String, dynamic> json) {
    return Carigorymodel(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  // ✅ Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
    };
  }
}
