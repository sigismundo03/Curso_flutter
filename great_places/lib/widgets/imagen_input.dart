import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagenInput extends StatefulWidget {
  @override
  _ImagenInputState createState() => _ImagenInputState();
}

class _ImagenInputState extends State<ImagenInput> {
  File _storedImage;

  _takePicture() async{
    final ImagePicker _picker =ImagePicker();
    PickedFile imageFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
      
    );

    if(imageFile  == null) return;

    setState(() {
       _storedImage = File(imageFile.path);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null ? 
          Image.file(
            _storedImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ):
           
           Text('Nenhuma imagem!'),
        ),
        SizedBox(
          width: 10,
        ),
       Expanded(
          child: FlatButton.icon(
            onPressed:_takePicture,
            icon: Icon(Icons.camera),
            textColor: Theme.of(context).primaryColor,
            label: Text('Tirar Foto!'),
          ),
        ),
      ],
    );
  }
}
