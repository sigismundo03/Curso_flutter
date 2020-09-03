import 'package:flutter/material.dart';
import 'package:shop/views/cartview.dart';

import 'views/orders_view.dart';
import 'views/produtooverview_viwes.dart';
import './views/product_detalhe_view.dart';
import './utils/app_routes.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(
            create: (_) =>  Products(),
          ),
          ChangeNotifierProvider(
            create: (_) =>  Cart(),
          ),
          ChangeNotifierProvider(
            create: (_) =>   Orders(),
          ),


      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        //home: ProdutoOverviewViewes(),
        routes: {
          AppRoutes.HOME: (context) => ProdutoOverviewViewes(),
          AppRoutes.PRODUCT_DETALHE: (context) => ProductDetalheView(),
          AppRoutes.Cart: (context) => CartView(),
          AppRoutes.ORDERS: (context) => OrdersView(),
        },
      ),
    );
  }
}
