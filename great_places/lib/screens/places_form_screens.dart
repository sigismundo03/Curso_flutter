import 'package:flutter/material.dart';
import 'package:great_places/widgets/imagen_input.dart';

class PlacesFormScreen extends StatefulWidget {
  @override
  _PlacesFormScreenState createState() => _PlacesFormScreenState();
}

class _PlacesFormScreenState extends State<PlacesFormScreen> {
final _textController = TextEditingController();

void _submitForm(){

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
                    ImagenInput(),
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
