import 'package:flutter/cupertino.dart';
import 'package:great_places/models/place.dart';

class GreatPlace with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  int get coutItems{
    return _items.length;
  }

  Place  itemByIndex( int index){
    return _items[index];
  }



}