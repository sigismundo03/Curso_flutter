import 'package:flutter/material.dart';
import 'views/category_view.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go we Cook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryView(),
    );
  }
}
 