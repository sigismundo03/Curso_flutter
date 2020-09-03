import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class OrderWidget extends StatefulWidget {
  final Order orders;

  const OrderWidget(this.orders);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expande = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.orders.total.toStringAsFixed(2)}'),
            subtitle: Text(
                DateFormat('dd/MM/yy hh:mm').format(widget.orders.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expande = !_expande;
                });
              },
            ),
          ),
          if(_expande)
          Container(
            height: (widget.orders.products.length * 25.00) + 10,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: ListView(
              children: widget.orders.products.map((product){
                return Row(
                  children: [
                   Text(
                     product.title,
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   Text(
                    '${product.quantity}x R\$ ${product.price} ',
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.grey,
                     ),
                   ),

                  ],
                );
              }
             ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
