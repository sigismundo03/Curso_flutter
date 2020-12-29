import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImagenInput extends StatefulWidget {
  final Function oneSelect;

  ImagenInput(this.oneSelect);


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

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(_storedImage.path);
    final savedImage =  await _storedImage.copy('${appDir.path}/$fileName');

    widget.oneSelect(savedImage);

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
