
import 'dart:math';
import 'package:expenses/components/chat.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transactionForm.dart';
import 'package:flutter/material.dart';
import 'components/transactionList.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
           headline6: TextStyle(fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          )
        )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transaction = [
   Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    
  ];

  List<Transaction> get  _recentTransactions{
    return _transaction.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7)
      
      ));
     }
    );
  }
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
    Navigator.of(context).pop();
  }

  _openTransactionForModol(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addtransaction);

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
         Text("Despesas pessoal"
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: ()=>_openTransactionForModol(context)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactinList(_transaction),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_openTransactionForModol(context),
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
