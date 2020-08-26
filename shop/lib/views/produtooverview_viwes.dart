import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';


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
            itemBuilder: (_) =>[
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
        ],
      ),
      body: ProductGrid(_showFavorite),
    );
  }
}