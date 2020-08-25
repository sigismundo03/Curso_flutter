import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';


class ProdutoOverviewViewes extends StatelessWidget  {
  
  
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Loja"),
      ),
      body: ProductGrid(),
    );
  }
}