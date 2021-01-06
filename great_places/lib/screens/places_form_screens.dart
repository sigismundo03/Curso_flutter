import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/imagen_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlacesFormScreen extends StatefulWidget {
  @override
  _PlacesFormScreenState createState() => _PlacesFormScreenState();
}

class _PlacesFormScreenState extends State<PlacesFormScreen> {
final _textController = TextEditingController();
File _pikerdImage;
void _seelectImage( File pikerdImage){
  _pikerdImage = pikerdImage;
}
void _submitForm( ){

  if(_textController.text.isEmpty || _pikerdImage == null){
    return;
  }

  Provider.of<GreatPlaces>(context,listen: false,).addPlace(
     _textController.text ,
     _pikerdImage, 
    
  );

  Navigator.of(context).pop();
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo lugar'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'Titulo',
                        
                      ),
                    ),
                    ImagenInput(this._seelectImage),
                    SizedBox(height: 10,),
                    LocationInput(),

                  ],

                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _submitForm, 
            icon: Icon(Icons.add),
            label: Text("Adicionar"),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    
    );
  }
}
