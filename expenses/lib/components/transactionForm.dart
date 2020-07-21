import 'package:expenses/components/adaptative_pircker.dart';
import 'package:flutter/material.dart';


import 'adaptative_forms.dart';
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
                     AdaptativeForm(
                       controller: _titlecontrole,
                       onSubmitted:  (_) => _subform(),
                       label: "titulo",
                       
                     ),
                     AdaptativeForm(
                       controller: _valuecontrole,
                       onSubmitted: (_) => _subform(),
                       keyboardType: TextInputType.numberWithOptions(),
                       label: "Valor (R\$)",
                     ),
                    AdaptativePircker(selectDate: _dateTime,onDateChangend: (newdate){
                        setState(() {
                          _dateTime = newdate;
                        });
                    },
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