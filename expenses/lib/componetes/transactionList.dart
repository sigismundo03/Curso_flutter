import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactinList extends StatelessWidget {

  final List<Transaction> transaction ;
  
  TransactinList(this.transaction);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child:ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (BuildContext context, int index) {
          final trans = transaction[index];
          return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                    ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,

                    ),
                    
                  ),
                  padding: EdgeInsets.all(10),
                    child: Text(
                      "R\$ ${trans.value.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.purple,fontSize: 15,
                      fontWeight: FontWeight.bold,
                      
                      ),
                    ),

                  ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(trans.title,
                      style: TextStyle(color: Colors.black,fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat("d MMM y").format(trans.date),
                      style: TextStyle(color: Colors.grey,fontSize: 15,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                  ),
                  
                ],
                
              ),
              );
              
        },
        
      ),
    
     
    );
  }
}