import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeForm extends StatelessWidget {
  final TextEditingController controller;
 final Function(String) onSubmitted;
 final String label;
 final TextInputType  keyboardType;



  AdaptativeForm({
    this.label,
   this.controller,
   this.onSubmitted,
   this.keyboardType = TextInputType.text,
   
   }); 



  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: CupertinoTextField(
         controller: controller,
        onSubmitted: onSubmitted,
         keyboardType: keyboardType,
         placeholder: label,
         padding: EdgeInsets.symmetric(
           horizontal: 6,
           vertical: 12,
         ),

      ),
    ):TextField(
      controller: controller,
      onSubmitted: onSubmitted,
       keyboardType: keyboardType,
         decoration: InputDecoration(
         labelText: label,
        )
      
    );
  }
}