import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLocation{
  final double latitude;
  final double longetude;
  final String adress;

  PlaceLocation({
    @required this.latitude,
    @required this.longetude,
    this.adress,
  
  }  
  );

}

class Place {
  final String id;
  final String title;
  final  PlaceLocation location;
  final File imagen;


  Place({
    @required this.id,
    @required this.imagen,
    @required this.location,
    @required this.title,

  });

}