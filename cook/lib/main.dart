import 'dart:ui';

import 'package:cook/util/approutes.dart';
import 'package:cook/views/meal_detail_view.dart';
import 'package:flutter/material.dart';
import 'views/category_meals_view.dart';
import 'views/category_view.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go we Cook',
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
        AppRoutes.Home: (context) => CategoryView(),
        AppRoutes.CATEGORY_EMAILS:(context) => CategoryMealsView(),
        AppRoutes.MEAL_DETAIL:(context) => MealDetailView(),
      },
    
    );
  }
}
 