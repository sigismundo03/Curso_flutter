import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/cart.dart';
import '../providers/Product.dart';
import '../providers/cart.dart';
import '../utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    final Product product = Provider.of<Product >(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);
    final Auth auth = Provider.of(context, listen: false);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_DETALHE,
                arguments: product,
              );
            },
            child: Image.network(product.imageUrl,
              fit: BoxFit.cover,
          ),
          ),
          footer: GridTileBar(
            backgroundColor:  Colors.black87,
            leading:Consumer <Product>(
              builder: (context, product,_) =>  IconButton(
              icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: (){
                product.toggleFavorite(auth.toke, auth.userId);
              },
              ),
            ),
            
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),

            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Theme.of(context).accentColor,
              onPressed: (){
                 Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Produto adiconado com sucesso!'
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'DESFAZER',
                      onPressed: (){
                        cart.removeSigleItem(product.id);
                      },
                      
                    ),
                  )
                );
                cart.addItem(product);
                
              },
              
              ),
            
            ),
          
          
        ),
    );
  }
}