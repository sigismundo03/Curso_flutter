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
      final String title = titlecontrole.text;
      final double value = double.tryParse(valuecontrole.text) ?? 0.0;
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
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                          Text('Nenhum data Selecionada!'),
                          FlatButton(
                            textColor: Theme.of(context).primaryColor,
                            child: Text(
                              "seleciona a data",
                              style: TextStyle(fontWeight: FontWeight.bold,
                             ),
                            ),
                            onPressed: (){
                              
                            },
                          )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton( 
                        child: Text("Nova trasação"),
                        textColor: Theme.of(context).textTheme.button.color,
                        color:Theme.of(context).primaryColor,                        
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