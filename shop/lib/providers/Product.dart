import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class  Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  
   Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

void _toggleFavorite() {
  this.isFavorite = !this.isFavorite; 
   notifyListeners();
}
 Future<void> toggleFavorite() async{
    _toggleFavorite();
    
    try{
       final url = "url,produto/$id.josn";
    final response = await http.patch(url, body: json.encode(
      {
        'isFavorite':isFavorite,
      }
    ));

    if(response.statusCode>= 400){
      _toggleFavorite();
    }
    } catch(error){
     _toggleFavorite();
    }

   
  }
}