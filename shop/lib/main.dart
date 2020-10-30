import 'package:flutter/material.dart';
import 'package:shop/views/auth_home_view.dart';
import 'package:shop/views/cartview.dart';

import 'views/orders_view.dart';
import 'views/productview.dart';
import 'views/productformview.dart';
import './views/product_detalhe_view.dart';
import './utils/app_routes.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
            create: (_) =>   Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (_) =>   Products(),
            update: (context, auth, proviousProduct) =>  new Products(auth.toke,auth.userId, proviousProduct.items),
          ),
          ChangeNotifierProvider(
            create: (_) =>  Cart(),
          ),
    
          ChangeNotifierProxyProvider<Auth,  Orders>(
            create: (_) =>   Orders(),
            update: (context, auth, proviousOrders) =>  new Orders(auth.toke, auth.userId, proviousOrders.items),
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
          AppRoutes.AUTH: (context) => AuthHomeView(),
          AppRoutes.PRODUCT_DETALHE: (context) => ProductDetalheView(),
          AppRoutes.Cart: (context) => CartView(),
          AppRoutes.ORDERS: (context) => OrdersView(),
          AppRoutes.PRODUCT: (context) => ProdutoView(),
          AppRoutes.PRODUCT_Form: (context) => ProductFormView(),

         
        },
        
      ),
    );
  }
}
