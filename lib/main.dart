import 'dart:math';

import 'package:flutter/material.dart';
import 'package:staggered_animation/widgets/order_list.dart';

import 'models/address.dart';
import 'models/order_model.dart';
import 'models/product.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ordersList = [
    Order(
      id: '#${Random().nextInt(9999999)}',
      sender: User(
        firstname: 'Samira',
        lastname: 'Doe',
        evaluation: 4,
      ),
      product: Product(
        price: 78.99,
        image:
            'https://unsplash.com/photos/yjAFnkLtKY0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MzB8fHByb2R1Y3R8ZW58MHx8fHwxNjU1NjcyNDkw&force=true&w=640',
        weight: 56,
      ),
      shippingCost: 50.0,
      sendingFrom: Address(
        street: 'Jhophed Cafe Rd',
        number: 769,
        city: 'Bristol',
        state: 'UK',
        zipCode: 11210,
      ),
      sendingTo: Address(
        street: 'Bohemar Avenue',
        number: 67,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 16237,
      ),
    ),
    //
    Order(
      id: '#${Random().nextInt(9999999)}',
      sender: User(
        firstname: 'Samira',
        lastname: 'Doe',
        evaluation: 3,
      ),
      product: Product(
        price: 80.99,
        image:
            'https://unsplash.com/photos/yjAFnkLtKY0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MzB8fHByb2R1Y3R8ZW58MHx8fHwxNjU1NjcyNDkw&force=true&w=640',
        weight: 72,
      ),
      shippingCost: 50.0,
      sendingFrom: Address(
        street: 'Jhophed Cafe Rd',
        number: 761,
        city: 'Brostol',
        state: 'UK',
        zipCode: 11710,
      ),
      sendingTo: Address(
        street: 'Bohemiar Avenue',
        number: 46,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11237,
      ),
    ),
    //
    Order(
      id: '#${Random().nextInt(9999999)}',
      sender: User(
        firstname: 'Kiyara',
        lastname: 'Navy',
        evaluation: 3,
      ),
      product: Product(
        price: 67.99,
        image:
            'https://unsplash.com/photos/yjAFnkLtKY0/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MzB8fHByb2R1Y3R8ZW58MHx8fHwxNjU1NjcyNDkw&force=true&w=640',
        weight: 65,
      ),
      shippingCost: 50.0,
      sendingFrom: Address(
        street: 'Smoky Hollow Rd',
        number: 761,
        city: 'Brooklyn',
        state: 'NY',
        zipCode: 11210,
      ),
      sendingTo: Address(
        street: 'Jhoshped Avenue',
        number: 46,
        city: 'Bristol',
        state: 'Uk',
        zipCode: 11237,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Staggered Animation Flutter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade300,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Staggered Animation!'),
        ),
        body: OrderList(orders: ordersList),
      ),
    );
  }
}
