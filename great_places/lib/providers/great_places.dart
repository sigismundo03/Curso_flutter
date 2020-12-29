import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:great_places/data/db_data.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  Future<void> loadPlaces() async{
    final dataList = await DataUtil.getData('places');
    _items = dataList.map(
      (item) => Place(
        id: item['id'],
        imagen:  File(item['imagen']),
         location: null,
        // location: item['location'],
        title:  item['title'],

      ),
      
    ).toList();
    notifyListeners();


  }

  List<Place> get items{
    return [..._items];
  }

  int get coutItems{
    return _items.length;
  }

  Place  itemByIndex( int index){
    return _items[index];
  }

  void addPlace( String title, File imagem){
    final newPlace = Place(
      id:  Random().nextDouble().toString(),
      imagen: imagem,
      location:null,
      title: title,
    );
    _items.add(newPlace);
    DataUtil.insert('places', {
      'id':newPlace.id,
      'title':newPlace.title,
      'imagen':newPlace.imagen.path,

    });
    notifyListeners();

  }



}