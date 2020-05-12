import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String , double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titlecontrole = TextEditingController();

  final valuecontrole = TextEditingController();

  _subform(){
      final title = titlecontrole.text;
      final value = double.tryParse(valuecontrole.text) ?? 0.0;
      if(title.isEmpty || value <= 0 ){
        return;
      }
     widget.onSubmit(title,value);
  }

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
                    onSubmitted: (_) => _subform,
                    decoration: InputDecoration(
                    labelText: "titulo",
                    )

                  ),
                  TextField(
                    controller: valuecontrole,
                    onSubmitted: (_) => _subform,
                    keyboardType: TextInputType.numberWithOptions(),
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
                        onPressed: _subform, 
                      )
                    ],
                  )
                ],
              ),
              
            ),
          );
  }
}