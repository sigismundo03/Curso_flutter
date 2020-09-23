import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Product.dart';
import 'package:shop/providers/products.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
 final Product product;

  ProductItem(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
       leading: CircleAvatar(
         backgroundImage: NetworkImage(product.imageUrl),
         
       ),
       title: Text(product.title),
       trailing: Container(
         width: 100,
         child: Row(
           children: [
             IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: (){
                  Navigator.of(context).pushNamed(
                    AppRoutes.PRODUCT_Form,
                    arguments: product,
                  );
              },
             ),
             IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: (){
                AlertDialog(
              title: Text('Tem certeza ?'),
              content: Text('Quer remove produto? '),
              actions: [
                FlatButton(
                  child: Text("Não"), 
                onPressed: (){
                  Navigator.of(context).pop();
                },
               
                ),
                FlatButton(
                  
                child: Text("Sim"),
                  onPressed: (){
                  Navigator.of(context).pop();
                   Provider.of<Products>(context,listen: false).deleteProduct(product.id);

                },
                ),
              ],
              );
               
              },
             )
           ],
         ),
       ),
      
    );
  }
}