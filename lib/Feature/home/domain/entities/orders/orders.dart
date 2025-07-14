import 'package:equatable/equatable.dart';

import '../DeliverInfo/deliveryInfo.dart';
import '../product/productEntites.dart';

class OrderDetiles extends Equatable {
  final String id;
  final List<OrderItem> orderItems;
  final DeliveryInfo deliveryInfo;
  final double discount;

  const OrderDetiles({
    required this.id,
    required this.orderItems,
    required this.deliveryInfo,
    required this.discount,
  });

  @override
  List<Object?> get props => [id, orderItems, deliveryInfo, discount];
}class OrderItem extends Equatable {
  final String id;
  final ProductEntites product;
  final PriceTag priceTag;
  final double price;
  final int quantity;

  const OrderItem({
    required this.id,
    required this.product,
    required this.priceTag,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, product, priceTag, price, quantity];
}

