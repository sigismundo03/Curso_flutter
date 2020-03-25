
import 'package:flutter/material.dart';


class Questao extends StatelessWidget {
 
  final String texto;
  
  Questao(this.texto); 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Text(
        texto,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}