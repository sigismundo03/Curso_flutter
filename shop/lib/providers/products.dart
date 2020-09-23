import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/providers/Product.dart';

class Products with ChangeNotifier{
  final  url= 'coloca minha url';

  List<Product> _items =[];



  List<Product> get items => [ ..._items];

  int get itemCount{
    return _items.length;
  }

  List<Product> get itemsFavorite {
  return _items.where((prod) => prod.isFavorite);
  
  } 
  
  Future<void> loaProducts() async{
    final response = await http.get(url);
    Map<String,dynamic> data = json.decode(response.body);
    _items.clear();
    if(data !=null){
       
       data.forEach((productId, productData) {
      _items.add(Product(
      id: productId,
      title: productData['title'],
      price: productData['price'],
      description: productData['description'],
      imageUrl: productData['imageUrl'],
      isFavorite: productData['isFavorite'],
    ));
      
    });
    notifyListeners();
    }
   
    
    return Future.value();

  }

  Future<void> addProduct(Product product) async{
    
    final response = await http.post(
      url,
      body: json.encode({
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'imageUrl': product.imageUrl,
      'isFavorite': product.isFavorite,
      }
    ),
    
    );
    _items.add(Product(
      id: json.decode(response.body)["name"],
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
    ));
     notifyListeners();

    
  }

   void updateProduct(Product product){
     if(product == null && product.id == null){
       return;
     }
    final index = _items.indexWhere((produ) => produ.id==product.id);
    
    if(index >=0){
      _items[index] = product;
       notifyListeners();

    }

   }

   void deleteProduct(String id){
     final index = _items.indexWhere((product) => product.id==id);
      if(index>=0){
        final product = _items[index];
        _items.remove(product); 
        notifyListeners();

      }
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
