import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/providers/Product.dart';
import 'package:shop/utils/constant.dart';
import '../exceptions/httpexception.dart';

class Products with ChangeNotifier{
  final  baseurl= '${Urls.Base_API}produto';

  List<Product> _items =[];



  List<Product> get items => [ ..._items];

  int get itemCount{
    return _items.length;
  }

  List<Product> get itemsFavorite {
  return _items.where((prod) => prod.isFavorite);
  
  } 
  
  Future<void> loaProducts() async{
    final response = await http.get("$baseurl.json");
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
      "$baseurl.json",
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

   Future<void> updateProduct(Product product) async{
     if(product == null && product.id == null){
       return;
     }
    final index = _items.indexWhere((produ) => produ.id==product.id);
    
    if(index >=0){
      await http.patch("$baseurl/${product.id}.json", body: json.encode({
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'imageUrl': product.imageUrl,
      },),);
      _items[index] = product;
       notifyListeners();

    }

   }

   Future<void> deleteProduct(String id) async{
     final index = _items.indexWhere((product) => product.id==id);
      if(index>=0){
        final product = _items[index];
        _items.remove(product); 
          notifyListeners();

        final response= await http.delete("$baseurl/${product.id}.json",);
        
          if(response.statusCode >= 400){
            _items.insert(index, product);
               notifyListeners();
               throw HttpException("Ocorreu um error em adiciona o produto");
          } 
         
        
       

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
