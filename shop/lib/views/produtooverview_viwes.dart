import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/providers/cart.dart';
import '../utils/app_routes.dart';


enum FilterOption{
  Favorite,
  All,
}

class ProdutoOverviewViewes extends StatefulWidget  {
  
  @override
  _ProdutoOverviewViewesState createState() => _ProdutoOverviewViewesState();
}

class _ProdutoOverviewViewesState extends State<ProdutoOverviewViewes> {
  bool _showFavorite = false;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Loja"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption sect){
              setState(() {
                if(sect == FilterOption.Favorite ){
                    _showFavorite = true;
                }else{
                   _showFavorite = false ;
                }
              });

            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOption.Favorite,
              ),

              PopupMenuItem(
                child: Text('todos'),
                value: FilterOption.All,
              ),
              
            ],
          ),
          Consumer<Cart>(
            builder:(context,cart,_)=> Badge(
              value: cart.coutitem.toString(),
              child: IconButton(
                  icon: Icon(Icons.add_shopping_cart) ,
                  onPressed: (){
                    Navigator.of(context).pushNamed(
                      AppRoutes.Cart,
                    );
                  },
              ),
              
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavorite),
    );
  }
}