import 'package:cook/data/dummy_data.dart';
import 'package:cook/models/category.dart';
import 'package:flutter/material.dart';
import '../components/mealItem.dart';

class CategoryMealsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    } ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle:true,
        
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context,index){
            return  MealItem(categoryMeals[index]);
          },

        ),
      
    );
  }
}