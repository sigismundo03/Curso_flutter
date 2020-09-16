import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/providers/Product.dart';

class ProductFormView extends StatefulWidget {
  @override
  _ProductFormViewState createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageControle = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  
  
  @override
  void initState() {
    super.initState();
    _imageUrlFocusNode.addListener( updateImage);
  }

  void updateImage(){
     if(isValidateUrl(_imageControle.text)){
        setState(() {
        
      });
     }
     
  }

  bool isValidateUrl(String url){
    bool stardWithHTTp = url.toLowerCase().startsWith("http://"); 
    bool stardWithHTTps = url.toLowerCase().startsWith("https://"); 
    bool endWithPng = url.toLowerCase().endsWith("png"); 
    bool endWithJpg = url.toLowerCase().endsWith(".jpg"); 
    bool endWithJpeg = url.toLowerCase().endsWith(".jpeg"); 

    return (stardWithHTTp || stardWithHTTps) && (endWithPng || endWithJpg || endWithJpeg);

  }

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imageUrlFocusNode.removeListener( updateImage);
    _imageUrlFocusNode.dispose();
  }

  void _saveForm() {
   var isValid = _form.currentState.validate();

   if(!isValid){
     
   }

    _form.currentState.save();
    final newProduct = Product(
      description: _formData["description"],
      id: Random().nextDouble().toString(),
      imageUrl: _formData["imageUrl"],
      price:_formData["price"] ,
      title: _formData["title"],
      

    );

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de produto"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){

            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titulo',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value){
                  _formData["title"] =  value;
                },
                validator: (value) {

                  if(value.trim().isEmpty){
                    return "Informe o titulo dado obigatorio";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'preço',
                ),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSaved: (value){
                  _formData["price"] =  double.parse(value);
                },
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
                focusNode: _descFocusNode,
                onSaved: (value){
                  _formData["description"] =  value;
                },
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                validator: (value){
                  bool urlvazia = value.trim().isEmpty;
                  bool urlinvalida = !isValidateUrl(value);

                  if(urlvazia){
                    return "Url Vazia";

                  }else if(urlinvalida){
                      return "url invalida. Digite uma Url valida";

                }else{
                   return null; 
                 }
                },

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Url da Imagem',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: _imageUrlFocusNode,
                      controller: _imageControle,
                      onSaved: (value){
                        _formData["imageUrl"] =  value;
                      },
                      onFieldSubmitted: (_){
                        _saveForm();
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    
                    alignment: Alignment.center,
                    child: _imageControle.text.isEmpty ?
                    Text("infome a URL"):
                    FittedBox(child: Image.network(
                      _imageControle.text),
                      fit: BoxFit.cover, 
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}