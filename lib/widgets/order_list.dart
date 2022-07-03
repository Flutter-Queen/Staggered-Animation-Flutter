import 'package:flutter/material.dart';

import '../models/order_model.dart';
import 'order_entry.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;

  const OrderList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          ...(orders.map((Order order) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: OrderEntry(order: order),
            );
          }).toList()),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
