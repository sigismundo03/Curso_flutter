import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'transactionitem.dart';

class TransactinList extends StatelessWidget {

  final List<Transaction> transaction;
  final void Function(String) onRemove;

  TransactinList(this.transaction, this.onRemove);


  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty ?
    LayoutBuilder(
      builder: (cxt, constraints) {
        return  Column(
        children: <Widget>[
          const SizedBox(height: 20,),
           Text("Nenhuma transação",
          style: Theme.of(context).textTheme.headline6,
          ),
         const SizedBox(height: 20,),
          Container(
          height:constraints.maxHeight * 0.6,
            child: Image.asset("assets/images/waiting.png",
            fit: BoxFit.cover,
            ),
          ),
        ],
    );
      }
    
     ): ListView.builder(
      itemCount: transaction.length,
      itemBuilder: (BuildContext context, int index) {
        final trans = transaction[index];
        return Transacnitem(trans: trans, onRemove: onRemove);
            
      },
     
    );
  }
}
