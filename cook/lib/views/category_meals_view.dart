import 'package:cook/models/category.dart';
import 'package:flutter/material.dart';

class CategoryMealsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle:true,
        
        ),
        body: Text("Receita por categoria"),
      
    );
  }
}