import 'package:flutter/material.dart';

import '../models/order_model.dart';
import 'animated_folding.dart';
import 'header.dart';
import 'order_section.dart';
import 'order_summary.dart';

class OrderEntry extends StatefulWidget {
  final Order order;

  const OrderEntry({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderEntry> createState() => _OrderEntryState();
}

class _OrderEntryState extends State<OrderEntry>
    with SingleTickerProviderStateMixin {
  double height = 180;
  late final AnimationController _controller;
  final Duration duration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
///********FOLDING CARD ANIMATION************///
  void _toggleAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  ///******** SENDER SECTION************///
  Widget _senderSection() {
    return OrderEntrySectionRow(
      height: 85,
      padding:
          const EdgeInsets.only(top: 5.0, bottom: 2.5, left: 10.0, right: 10.0),
      children: [
        OrderEntrySection(
          title: 'Sender',
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset('assets/woman.jpg', height: 45.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.order.sender.firstname} ${widget.order.sender.lastname}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            i < widget.order.sender.evaluation
                                ? Icons.star
                                : Icons.star_border,
                            color: i < widget.order.sender.evaluation
                                ? Colors.yellow
                                : Colors.black54,
                          )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
 ///******** ADDRESS SECTION************///
  Widget _addressSection() {
    return OrderEntrySectionRow(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
      children: [
        OrderEntrySection(
          title: 'From',
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              '${widget.order.sendingFrom.number} ${widget.order.sendingFrom.street}',
            ),
            Text(
              '${widget.order.sendingFrom.city}, ${widget.order.sendingFrom.state} ${widget.order.sendingFrom.zipCode}',
            ),
          ],
        ),
        OrderEntrySection(
          title: 'To',
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              '${widget.order.sendingTo.number} ${widget.order.sendingTo.street}',
            ),
            Text(
              '${widget.order.sendingTo.city}, ${widget.order.sendingTo.state} ${widget.order.sendingTo.zipCode}',
            ),
          ],
        ),
      ],
    );
  }
 ///******** DELIVERY SECTION************///
  Widget _deliverySection() {
    return const OrderEntrySectionRow(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.5),
      children: [
        OrderEntrySection(
          title: 'Delivery Date',
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              '6:30 pm',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('July 10, 2022'),
          ],
        ),
        OrderEntrySection(
          title: 'Request Deadline',
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              '24 minutes',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
 ///******** FOOTER SECTION************///
  Widget _messageSection() {
    return Container(
        height: 75,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {},
              child: const Text("Contact Sender"),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {},
                child: const Text("Remove"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnimation,
      child: AnimatedFoldingWidget(
        animation: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              0.0,
              1 / 3,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        behind: OrderEntryHeader(
          height: 180,
          order: widget.order,
        ),
        front: OrderEntrySummary(
          order: widget.order,
        ),
        next: Column(
          children: [
            _senderSection(),
            AnimatedFoldingWidget(
              animation: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(
                    1 / 3,
                    1 / 3 * 2,
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
              behind: _addressSection(),
              front: Container(
                height: 75,
                color: Colors.white,
              ),
              next: AnimatedFoldingWidget(
                animation: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: const Interval(
                      1 / 3 * 2,
                      1.0,
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
                behind: _deliverySection(),
                front: Container(
                  height: 75,
                  color: Colors.white,
                ),
                next: _messageSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
