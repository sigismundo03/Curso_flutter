import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/places_list_screens.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'screens/places_form_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  GreatPlaces(

      ),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
        
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          
          
          
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:PlacesListScreens(),
        routes: {
          AppRoutes.PLACE_FORM: (context) => PlacesFormScreen(),
        },
      ),
    );
  }
}
