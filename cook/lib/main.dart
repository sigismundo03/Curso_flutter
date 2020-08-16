import 'dart:ui';

import 'views/tabs_view.dart';
import 'package:cook/util/approutes.dart';
import 'package:cook/views/meal_detail_view.dart';
import 'package:flutter/material.dart';
import 'views/category_meals_view.dart';
import 'views/settings_view.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  List<Meal> _availableMeals =  DUMMY_MEALS;

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
        AppRoutes.Home: (context) => TabsView(),
        AppRoutes.CATEGORY_EMAILS:(context) => CategoryMealsView(_availableMeals),
        AppRoutes.MEAL_DETAIL:(context) => MealDetailView(),
        AppRoutes.Settings:(context) => SettingsView(),
      },
    
    );
  }
}
 