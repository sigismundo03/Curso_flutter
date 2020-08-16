import 'package:cook/models/category.dart';
import 'package:flutter/material.dart';
import '../components/mealItem.dart';
import '../models/meal.dart';


class CategoryMealsView extends StatelessWidget {

    final List<Meal> meals;

    const CategoryMealsView(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal){
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