import 'dart:html';

import 'package:cook/util/approutes.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';


class CategoryItem extends StatelessWidget {
  
  final Category category;
 
  const CategoryItem({
  
   this.category
  
  });
  
void _selectCategory(BuildContext context){
  Navigator.of(context).pushNamed(
     AppRoutes.CATEGORY_EMAILS,
     arguments: category,
  );
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(this.category.title,
         style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              this.category.color.withOpacity(0.5),
              this.category.color,
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            
          ),
        ),
      ),
    );
  }
}