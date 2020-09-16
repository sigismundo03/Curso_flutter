import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/providers/products.dart';
import '../components/productitem.dart';
import '../utils/app_routes.dart';

class ProdutoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  productData = Provider.of<Products>(context);
    final products = productData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento de produtos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add) ,
            onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_Form);
            },
          )
        ],
      ),
      
      drawer: APPDrawer(),

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productData.itemCount,
          itemBuilder: (context, index){
            return Column(
              children: [
                ProductItem(products[index]),
                Divider()
              ],
            );
          }
        ),
        
      ),
   
    );
  }
}