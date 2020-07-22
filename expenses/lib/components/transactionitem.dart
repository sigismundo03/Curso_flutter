
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transacnitem extends StatelessWidget {

  final Transaction trans;
  final void Function(String p1) onRemove;
  
  const Transacnitem({
   
    @required this.trans,
    @required this.onRemove,
  });

  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            radius:30.0 ,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                child: Text('R\$${trans.value}'),),
            ),
          ),
          title: Text(
            trans.title,
            style: Theme.of(context).textTheme.bodyText2, 
          ),
          subtitle: Text(
            DateFormat('D MMM Y').format(trans.date),
          ),
          trailing:MediaQuery.of(context).size.width > 400 ? FlatButton.icon(
             icon:const Icon(Icons.delete),
            color: Theme.of(context).errorColor, 
            onPressed: ()=> onRemove(trans.id), 
            label: const Text("Excluir"),
            textColor:Theme.of(context).errorColor,
          )  : IconButton(
            icon: const Icon(Icons.delete),
            color: Theme.of(context).errorColor, 
            onPressed: ()=> onRemove(trans.id),
            ),
      ),
    );
        }
}