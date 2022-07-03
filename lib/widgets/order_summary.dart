import 'dart:math';
import 'package:flutter/material.dart';

import '../models/order_model.dart';

class OrderEntrySummary extends StatelessWidget {
  final Order order;
  final Random _random = Random();

  OrderEntrySummary({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        margin: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.teal,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${order.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Yesterday\n${_random.nextInt(13).toString().padLeft(2, '0')}:${_random.nextInt(60).toString().padLeft(2, '0')} ${_random.nextBool() ? 'pm' : 'am'}'
                            .toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            // topRight: Radius.circular(10.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle_outlined,
                                          size: 18,
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            '${order.sendingFrom.number} ${order.sendingFrom.street}, ${order.sendingFrom.city}, ${order.sendingFrom.state}',
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade800,
                                            ),
                                            maxLines: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.more_vert_outlined,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    const Icon(
                                      Icons.more_vert_outlined,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle_outlined,
                                          color: Colors.red,
                                          size: 18,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(
                                            '${order.sendingTo.number} ${order.sendingTo.street}, ${order.sendingTo.city}, ${order.sendingTo.state}',
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade800,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shipping\n\$${order.shippingCost.toStringAsFixed(2)}'
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.teal.shade500,
                                  ),
                                ),
                                Text(
                                  'Weight\n${order.product.weight} lbs'
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.teal.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
