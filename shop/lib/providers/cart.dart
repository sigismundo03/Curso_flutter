import 'dart:math';

import 'package:flutter/foundation.dart';
import './Product.dart';

class CartItem {
  final String id;
  final String title;
  final int  quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,

  });
  
}


class Cart with  ChangeNotifier{
  Map<String , CartItem> _item;

  Map<String , CartItem> get item{
    return { ..._item };
  }


  void addItem(Product product){
    if(_item.containsKey(product)){
      _item.update(product.id, (existItem){
        return CartItem(
          id: existItem.id,
          price: existItem.price,
          quantity: existItem.quantity + 1,
          title: existItem.title,
        );
      });
    }else{
      _item.putIfAbsent(product.id, () 
       => CartItem(
         id: Random().nextDouble().toString(),
          price: product.price,
          quantity:  1,
          title: product.title,
       )
      
      );
    }
    notifyListeners();
  }

}