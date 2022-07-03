import 'package:staggered_animation/models/product.dart';
import 'package:staggered_animation/models/user.dart';

import 'address.dart';

class Order {
  final String id;
  final User sender;
  final Product product;
  final double shippingCost;
  final Address sendingFrom;
  final Address sendingTo;

  Order({
    required this.id,
    required this.sender,
    required this.product,
    required this.shippingCost,
    required this.sendingFrom,
    required this.sendingTo,
  });
}
