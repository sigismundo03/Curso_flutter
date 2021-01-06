

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async{
    final locDate = Location().getLocation();


  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.green,
            ),
          ),
          child: _previewImageUrl == null ?
          Text('Localicão não informada!'):
           Image.network(
             _previewImageUrl,
             fit: BoxFit.cover,
             width: double.infinity,
           ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              icon:Icon(Icons.location_on) ,
              label: Text('Localização Atual'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon:Icon(Icons.map) ,
              label: Text('Selecione o Mapa'),
              textColor: Theme.of(context).primaryColor,
              onPressed: (){},
            ),
          ],
        ),
      ],
    );
  }
}
