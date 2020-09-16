import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/Product.dart';

class Products with ChangeNotifier{

  List<Product> _items = DUMMY_PRODUCT;



  List<Product> get items => [ ..._items];

  int get itemCount{
    return _items.length;
  }

  List<Product> get itemsFavorite {
  return _items.where((prod) => prod.isFavorite);
  
  } 
  
  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }

}

// bool _showFavorite = false;
  // void showFavorite( ) {
  //   this._showFavorite = true;
  //   notifyListeners();
  // }


  // void showAll( ) {
  //   this._showFavorite = false;
  //   notifyListeners();
  // }
