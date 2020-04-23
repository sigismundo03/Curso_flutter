
import 'package:flutter/material.dart';

import 'componetes/traansactionUser.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas pessoal"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
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
            TransactionUser(),
          ],
        ),
      ),
      floatingActionButton: ,
    );
  }
}
