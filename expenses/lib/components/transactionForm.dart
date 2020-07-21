import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adatative_button1.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String , double,DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titlecontrole = TextEditingController();

  final _valuecontrole = TextEditingController();
  DateTime _dateTime = DateTime.now();

  _subform(){
      final String title = _titlecontrole.text;
      final double value = double.tryParse(_valuecontrole.text) ?? 0.0;
      if(title.isEmpty || value <= 0 || _dateTime == null ){
        return;
      }
      widget.onSubmit(title,value,_dateTime);
  }
  _showDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime.now(),
      ).then((pickerDate) {
        if(pickerDate == null){
          return ;
        }
        setState((){
          _dateTime = pickerDate;
        });
        
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titlecontrole,
                      onSubmitted: (_) => _subform(),
                      decoration: InputDecoration(
                      labelText: "titulo",
                      )

                    ),
                    TextField(
                      controller: _valuecontrole,
                      onSubmitted: (_) => _subform(),
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        labelText: "Valor (R\$)",
                      )
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                            Expanded(
                              child: Text(
                                _dateTime == null ?'Nenhum data Selecionada!' :
                                     'Data selecionada ${ DateFormat('d/M/y').format(_dateTime)}'
                                
                                ),
                            ),
                            FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text(
                                "seleciona a data",
                                style: TextStyle(fontWeight: FontWeight.bold,
                               ),
                              ),
                              onPressed:_showDatePicker,
                            )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        AdaptativeButon(
                          label:"Nova trasação",
                          onpressed:_subform,
                          ),
                        
                      ],
                    )
                  ],
                ),
                
              ),
            ),
    );
  }
}