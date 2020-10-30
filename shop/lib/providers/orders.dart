import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constant.dart';

import './cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime dateTime;

  Order({
    this.id,
    this.total,
    this.products,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final baseUrl = "${Urls.Base_API}orders";
  String _token;
  String _userId;
  List<Order> _items = [];

  Orders([this._token, this._userId, this._items = const []]);
  List<Order> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  Future<void> addOrders(Cart cart) async {
    final date = DateTime.now();
    final response = await http.post('$baseUrl/$_userId.json?auth=$_token',
        body: json.encode({
          'total': cart.totalAmount,
          'dateTime': date.toIso8601String(),
          'products': cart.item.values.map((cartItem) => {
                'id': cartItem.id,
                'protuctId': cartItem.protuctId,
                'title': cartItem.title,
                'quantity': cartItem.quantity,
                'price': cartItem.price,
              }),
        }));
    if (response.statusCode == 200) {
      _items.insert(
        0,
        Order(
          id: json.decode(response.body)['name'],
          total: cart.totalAmount,
          dateTime: date,
          products: cart.item.values.toList(),
        ),
      );
    }

    notifyListeners();
  }

  Future<void> loaOrders() async {
    List<Order> loaditems = [];
    final response = await http.get("$baseUrl/$_userId.json?auth=$_token");
    Map<String, dynamic> data = json.decode(response.body);

    if (data != null) {
      data.forEach((orderId, orderData) {
        loaditems.add(Order(
          id: orderId,
          total: orderData["total"],
          dateTime: DateTime.parse(orderData["dateTime"]),
          products: (orderData['products'] as List<dynamic>).map((cartItem) {
            return CartItem(
              id: cartItem['id'],
              protuctId: cartItem['protuctId'],
              title: cartItem['title'],
              quantity: cartItem['quantity'],
              price: cartItem['price'],
            );
          }).toList(),
        ));
      });
      notifyListeners();
    }
    _items = loaditems.reversed.toList();

    return Future.value();
  }
}
