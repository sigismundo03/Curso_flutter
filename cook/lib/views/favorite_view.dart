import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/mealItem.dart';


class FavoriteView extends StatefulWidget {
  final List<Meal> favoriteMeals; 

  const FavoriteView(this.favoriteMeals);
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  

  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty ? 
    Center(
      child:Text("Nenhuma Refeição foi Marcada como Favorito") ,
      
    ):
    ListView.builder(
      itemCount: widget.favoriteMeals.length,
      itemBuilder:(context, index){
        return MealItem(widget.favoriteMeals[index]);
      }   
     );
  }
}