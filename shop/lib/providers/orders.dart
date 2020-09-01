import 'dart:math';

import 'package:flutter/cupertino.dart';

import './cart.dart';

class Order{

  final String id;
  final double total;
  final List<CartItem> products;
  final  DateTime dateTime;


  Order({
    this.id,
    this.total,
    this.products,
    this.dateTime,
  });
  
}


class Orders with ChangeNotifier{
  List<Order> _order = [];

  List<Order> get orders {
    return [..._order];
  }

  void addOrders(List<CartItem> products, double total ){
    _order.insert(0, Order(
        id: Random().nextDouble().toString(),
        total: total,
        dateTime: DateTime.now(),
        products: products,
    ),
    );
    notifyListeners();

  }

}
