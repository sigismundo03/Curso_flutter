import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/Product.dart';

class Products with ChangeNotifier{

  List<Product> _items = DUMMY_PRODUCT;

  List<Product> get items => [ ..._items];

  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }

}