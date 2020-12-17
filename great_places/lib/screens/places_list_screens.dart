import 'package:flutter/material.dart';

class PlacesListScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus lugares"),
        
      ),

      body: Center(
        child:CircularProgressIndicator(),
        
      ),
      
    );
  }
}