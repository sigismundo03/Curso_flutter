import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titlecontrole = TextEditingController();
  final valuecontrole = TextEditingController();
  final void Function(String , double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titlecontrole,
                    decoration: InputDecoration(
                    labelText: "titulo",
                    )

                  ),
                  TextField(
                    controller: valuecontrole,
                    decoration: InputDecoration(
                      labelText: "Valor (R\$)",
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton( 
                        child: Text("Nova trasação"),
                        textColor: Colors.purple,
                        color: Colors.green,                        
                        onPressed: (){
                          final title = titlecontrole.text;
                          final value = double.tryParse(valuecontrole.text) ?? 0.0;
                          onSubmit(title,value);
                        }, 
                      )
                    ],
                  )
                ],
              ),
              
            ),
          );
  }
}