

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Product.dart';
import 'package:shop/providers/products.dart';

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
  bool isLoanding = false;
  
  
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
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(_formData.isEmpty){
      var product = ModalRoute.of(context).settings.arguments as Product;
      if(product != null){
      _formData['id'] = product.id;
      _formData['title'] = product.title;
      _formData['price'] = product.price;
      _formData['description'] = product.description;
      _formData['imageUrl'] = product.imageUrl;

      }
      _imageControle.text =  _formData['imageUrl'] == null ? '': _formData['imageUrl'];
    }
  }

  Future<void> _saveForm() async{
   var isValid = _form.currentState.validate();

   if(!isValid){
     
   }

    _form.currentState.save();
    final newProduct = Product(
      description: _formData["description"],
      id:_formData['id'],
      imageUrl: _formData["imageUrl"],
      price:_formData["price"] ,
      title: _formData["title"],
      

    );

    setState(() {
      isLoanding=true;
    });


    final products = Provider.of<Products>(context, listen: false,);
    if(_formData['id'] == null){
      try{
        await products.addProduct(newProduct);
         Navigator.of(context).pop();
      } catch(error){
        await showDialog<Null>(
          context:context ,
          builder: (context,){
            return AlertDialog(
              title: Text("oCorreu um error"),
              content: Text(error.toString()),
              actions: [
                FlatButton(
                 onPressed: (){
                    Navigator.of(context).pop();
                 },
                 child: Text("Ok"),
                ),
              ],
            );
            
          }
        );
      } finally{
        setState(() {
          isLoanding=false;
        });
       
      }
     
      
    }else{
        setState(() {
          isLoanding=false;
        });
      products.updateProduct(newProduct);

    Navigator.of(context).pop();
    }


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

      body:  isLoanding ?Center(
        child: CircularProgressIndicator(),
      ): Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titulo',
                ),
                initialValue: _formData['title'],
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
                initialValue: _formData['price'].toString() ,
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
                validator: (value){
                  bool priceisvazia = value.trim().isEmpty;
                  var newprice = double.tryParse(value);
                  bool priceisinvalida = newprice == null || newprice <=0;
                  if(priceisvazia || priceisinvalida){
                    return "Informe um preço válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Descrição',
                ),
                initialValue:_formData['description'], 
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