import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/httpexception.dart';
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
    final scaffold = Scaffold.of(context);
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
                 showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
              title: Text('Tem certeza ?'),
              content: Text('Quer remove produto? '),
              actions: [
                FlatButton(
                  child: Text("Não"), 
                onPressed: (){
                  Navigator.of(context).pop(false);
                },
               
                ),
                FlatButton(
                  
                child: Text("Sim"),
                  onPressed: (){
                  Navigator.of(context).pop(true);
                   

                },
                ),
              ],
              ),
              ).then((value) async {
                  if (value) {
                    try {
                      await Provider.of<Products>(context, listen: false)
                          .deleteProduct(product.id);
                    } on HttpException catch (error) {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text(error.toString()),
                        ),
                      );
                    }
                    }
                  }
                  );
                  
              },
             ),
           ],
         ),
       ),
      
    );
  }
}