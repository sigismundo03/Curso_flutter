import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
  final baseUrl ="";
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  
  int get itemCount{
    return _items.length;
  }
  
   Future<void> addOrders(Cart cart ) async {
     final date =DateTime.now();
     final response = await http.post(baseUrl, body: json.encode({
        'total': cart.totalAmount,
        'dateTime': date.toIso8601String(),
        'products': cart.item.values.map((cartItem) => {
          'id':cartItem.id,
          'protuctId':cartItem.protuctId,
          'title':cartItem.title,
          'quantity':cartItem.quantity,
          'price':cartItem.price,
        }),
        
      }));
      if(response.statusCode == 200){
         _items.insert(0, Order(
        id: json.decode(response.body)['name'],
        total: cart.totalAmount,
        dateTime: date ,
        products: cart.item.values.toList(),
    ),
    );
      }
   
    notifyListeners();

  }

}
