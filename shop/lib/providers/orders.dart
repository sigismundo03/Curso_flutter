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
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  
  int get itemCount{
    return _items.length;
  }
  
  void addOrders(Cart cart ){
    _items.insert(0, Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        dateTime: DateTime.now(),
        products: cart.item.values.toList(),
    ),
    );
    notifyListeners();

  }

}
