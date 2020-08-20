import 'dart:ui';

import 'views/tabs_view.dart';
import 'package:cook/util/approutes.dart';
import 'package:cook/views/meal_detail_view.dart';
import 'package:flutter/material.dart';
import 'views/category_meals_view.dart';
import 'views/settings_view.dart';
import 'models/meal.dart';
import 'models/settengs.dart';
import 'data/dummy_data.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settengs _settengs =Settengs();
  List<Meal> _availableMeals =  DUMMY_MEALS;
  List<Meal> _favoriteMeals =  [];

  void _filterMeals(Settengs settengs){
      setState((){
        this._settengs = settengs;
        _availableMeals = DUMMY_MEALS.where((meal) {
          final filterGluter = settengs.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settengs.isLactoseFree && !meal.isLactoseFree;
          final filterVegano = settengs.isVegan && !meal.isVegan;
          final filterVegetariano = settengs.isVegetarian && !meal.isVegetarian;
          return !filterGluter && !filterLactose && !filterVegano && !filterVegetariano; 

        }).toList();
     });
  }



  void _toggleFavorite(Meal meal){
    setState((){
        _favoriteMeals.contains(meal) ?
        _favoriteMeals.remove(meal):
        _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal){
    return _favoriteMeals.contains(meal);
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '\vamos Cozinha? ',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        cardColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',

          ),
        ),
      ),
      routes: {
        AppRoutes.Home: (context) => TabsView(_favoriteMeals ),
        AppRoutes.CATEGORY_EMAILS:(context) => CategoryMealsView(_availableMeals),
        AppRoutes.MEAL_DETAIL:(context) => MealDetailView( _toggleFavorite, _isFavorite),
        AppRoutes.Settings:(context) => SettingsView(_settengs,_filterMeals),
      },
    
    );
  }
}
 