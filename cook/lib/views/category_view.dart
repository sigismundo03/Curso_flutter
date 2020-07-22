import 'package:cook/components/category_item.dart';
import 'package:cook/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Go We Cook"),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          
          ),
          children: DUMMY_CATEGORIES.map((cat) {
              return CategoryItem(category: cat);
          }).toList(),
        
      ),
    );
  }
}