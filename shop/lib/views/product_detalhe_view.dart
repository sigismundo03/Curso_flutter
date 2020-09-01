import 'package:flutter/material.dart';
import '../providers/Product.dart';

class ProductDetalheView extends StatelessWidget {

   

  @override
  Widget build(BuildContext context) {
   final Product product = ModalRoute.of(context).settings.arguments as Product;
 
    return Scaffold(

      appBar: AppBar(
        title: Text(product.title),
      ),

      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      
    );
  }
}