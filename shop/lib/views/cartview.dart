import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cartitemwidget.dart';
import '../providers/cart.dart';

class CartView extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItem = cart.item.values.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("carinho"),   
       ),

       body: Column(
         children: [
           Card(
            margin: const EdgeInsets.all(35),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10,),
                  Chip(
                    label: Text(
                      'R\$ ${cart.totalAmount.toString()}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: null,
                    child: Text(
                      'COMPRAR',
                      style: TextStyle(color: Theme.of(context).primaryColor,),
                    ),
                  ),
                ],
              ),

            ),
          ),

          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: cart.coutitem,
              itemBuilder: (context,index){
                return CartItemWidget(
                   cartItem: cartItem[index]
                  
                  );

              }
              
            ),
          
          ),

         ],
       ),
    );
  }
}