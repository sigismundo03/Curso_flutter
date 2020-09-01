import 'dart:math';

import 'package:flutter/foundation.dart';
import './Product.dart';

class CartItem {
  final String id;
  final String protuctId;
  final String title;
  final int  quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.protuctId,
    @required this.title,
    @required this.quantity,
    @required this.price,

  });
  
}


class Cart with  ChangeNotifier{
  Map<String , CartItem> _item = {};

  Map<String , CartItem> get item{
    return { ..._item };
  }

  int get  coutitem{
    return _item.length;
  }

  double get  totalAmount{
    double total = 0.0;

    _item.forEach((key, value) { 
      total += value.price;
    });
    return total;
  }

  void addItem(Product product){
    if(_item.containsKey(product)){
      _item.update(product.id, (existItem){
        return CartItem(
          id: existItem.id,
          protuctId:product.id,
          price: existItem.price,
          quantity: existItem.quantity + 1,
          title: existItem.title,
        );
      });
    }else{
      _item.putIfAbsent(product.id, () 
       => CartItem(
         id: Random().nextDouble().toString(),
         protuctId: product.id,
          price: product.price,
          quantity:  1,
          title: product.title,
       ),
      
      );
    }
    notifyListeners();
  }


  void remove(String productId ){
    _item.remove(productId);
    notifyListeners();
  }

  void clear(){
    _item = {};
    notifyListeners();
  }

}