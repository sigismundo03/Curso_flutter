import 'package:provider/provider.dart';
import 'package:shop/components/productgridItem.dart';
import 'package:shop/providers/products.dart';

import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {

    final bool _showFavorite;

    ProductGrid(this._showFavorite,);


  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final leaddedProduct = _showFavorite ? products.itemsFavorite: products.items;

    return GridView.builder(
      itemCount: leaddedProduct.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: leaddedProduct[index],
          child: ProductGridItem()
        );
      },
    );
  }
}
