import 'package:equatable/equatable.dart';

class Category  extends Equatable{
  final String id;
  final String name;
  final String image;

  Category({
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
