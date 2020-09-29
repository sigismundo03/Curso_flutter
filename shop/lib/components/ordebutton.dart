
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/orders.dart';

class OrdeButton extends StatefulWidget {
  const OrdeButton({
    
    @required this.cart,
  });

  final Cart cart;

  @override
  _OrdeButtonState createState() => _OrdeButtonState();
}

class _OrdeButtonState extends State<OrdeButton> {
  bool _isLoading = false;

  void loading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  FlatButton(
      onPressed: widget.cart.coutitem == 0 ? null: () async{
        loading();
        await Provider.of<Orders>(context, listen: false).addOrders(widget.cart,);
        widget.cart.clear();
        loading();
      },
      child:_isLoading ? Center(
      child: CircularProgressIndicator(),
    ): Text(
        'COMPRAR',
        style: TextStyle(color: Theme.of(context).primaryColor,),
      ),
    );
  }
}