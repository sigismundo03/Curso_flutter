import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../components/app_drawer.dart';
import '../components/order_widget.dart';

class OrdersView extends StatelessWidget {


    Future<void> _refreshOrders(BuildContext context) {
     return Provider.of<Orders>(context, listen: false).loaOrders();
    }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos')
      ),
      drawer: APPDrawer(),

       body:  FutureBuilder(
         future: Provider.of<Orders>(context, listen: false).loaOrders(),
         builder: (context, snapshot){
           if( snapshot.connectionState == ConnectionState.waiting){
             return Center(
                  child: CircularProgressIndicator()
             );
           }else{
            return Consumer <Orders>(
              builder: (context, orders, child){
                return RefreshIndicator(
                  onRefresh: () => _refreshOrders(context),
                  child:ListView.builder(
                  itemCount: orders.itemCount,
                  itemBuilder: (context, index) {
                    return OrderWidget(orders.items[index]);
                  }
                  
                ),
              );
              }
               
            );
           }
         }
        
        ),
       //_isLoading ?Center(
      // child: CircularProgressIndicator())
      // :
      // 
      //),
    );
  }
}