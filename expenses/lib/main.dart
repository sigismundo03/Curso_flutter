import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactino = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Despesas pessoal")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              elevation: 8,
              child: Text("Grafo"),
            ),
          ),
          Card(
            child: Text("lista de trasaçao"),
          ),
        ],
      ),
    );
  }
}
