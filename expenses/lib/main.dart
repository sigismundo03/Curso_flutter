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
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool swochart = false;
  final List<Transaction> _transaction = [];

  List<Transaction> get _recentTransactions {
    return _transaction.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addtransaction(String title, double valor, DateTime date) {
    final newtransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: valor,
      date: date,
    );
    setState(() {
      _transaction.add(newtransaction);
    });
    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transaction.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionForModol(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addtransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool islandscape =  MediaQuery.of(context).orientation == Orientation.landscape;



    final appbar = AppBar(
      title: Text("Despesas pessoal"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionForModol(context),),
      
     if(islandscape) IconButton(
            icon: Icon(swochart ? Icons.list: Icons.chat),
            onPressed: () {
              setState((){
                swochart = !swochart;
              });
            },),
      ],
    );
    final availableHeigth = MediaQuery.of(context).size.height -
        appbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // if(islandscape)
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text("Exebir o Gráfico"),
            //     Switch(
            //       value: true,
            //       onChanged: (value) {
            //         setState((){
            //           swochart = value;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            if (swochart || !islandscape)
             Container(
              height: availableHeigth * (islandscape ? 0.7:0.3),
              child: Chart(_recentTransactions),
            ),
            if (!swochart || islandscape)
            Container(
              height: availableHeigth * 0.7,
              child: TransactinList(_transaction, _deleteTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionForModol(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
