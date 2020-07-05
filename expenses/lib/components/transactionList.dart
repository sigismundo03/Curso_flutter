import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactinList extends StatelessWidget {

  final List<Transaction> transaction;
  
  TransactinList(this.transaction);


  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
      child:transaction.isEmpty ? Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text("Nenhuma transação",
          style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20,),
          Container(
          height: 200,
            child: Image.asset("assets/images/waiting.png",
            fit: BoxFit.cover,
            ),
          ),
        ],
      ): ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (BuildContext context, int index) {
          final trans = transaction[index];
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
            ),
          );
              
        },
        
      ),
    
     
    );
  }
}