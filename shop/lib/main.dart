import 'package:flutter/material.dart';

import 'views/produtooverview_viwes.dart';
import './views/product_detalhe_view.dart';
import './utils/app_routes.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  Products(),
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProdutoOverviewViewes(),
        routes: {
          AppRoutes.PRODUCT_DETALHE: (context) => ProductDetalheView(),
        },
      ),
    );
  }
}
