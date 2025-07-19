import 'package:equatable/equatable.dart';

class CategoryEntites  extends Equatable{
  final String id;
  final String name;
  final String image;

  CategoryEntites({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,name,image,
  ];


}
