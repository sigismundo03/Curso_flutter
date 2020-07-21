import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButon extends StatelessWidget {

  final label;
  final Function onpressed;

  AdaptativeButon({

   this.label, this.onpressed,});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoButton(
      child: Text(label), 
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 20,),
      ) :
      RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).textTheme.button.color,
      child: Text(label),
      onPressed: onpressed,
    );
  }
}