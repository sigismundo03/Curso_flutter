import 'dart:math';

import 'package:expenses/componetes/transactionForm.dart';
import 'package:expenses/componetes/transactionList.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transaction = [
    Transaction(
      id: 'ti1',
      title: 'novo tenis da nike',
      value: 305.40,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'ti1',
      title: 'novo tenis da nike',
      value: 305.40,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'ti2',
      title: 'novo notebook da ACER',
      value: 3050.40,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'ti3',
      title: 'novo bicicleta',
      value: 800.40,
      date: DateTime.now(),
    ),
  ];
  _addtransaction(String title, double valor) {
    final newtransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: valor,
      date: DateTime.now(),
    );
    setState(() {
      _transaction.add(newtransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            TransactionForm(_addtransaction),
            TransactinList(_transaction),
         
          ],
        
    );
  }
}
