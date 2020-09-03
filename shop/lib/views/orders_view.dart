import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../components/app_drawer.dart';
import '../components/order_widget.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos')
      ),
      drawer: APPDrawer(),

      body: ListView.builder(
        itemCount: orders.itemCount,
        itemBuilder: (context, index) {
          return OrderWidget(orders.items[index]);
        }
        
      ),
    );
  }
}