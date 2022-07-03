import 'package:flutter/material.dart';

import '../models/order_model.dart';

class OrderEntryHeader extends StatelessWidget {
  final double height;
  final Order order;

  const OrderEntryHeader({
    Key? key,
    required this.order,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bag.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListItemDetailsHeaderBar(
                order: order,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListItemDetailsHeaderBar extends StatelessWidget {
  final Order order;

  const ListItemDetailsHeaderBar({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.teal,
            child: InkWell(
              splashColor: Colors.teal[400],
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              order.id,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '\$${order.product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
