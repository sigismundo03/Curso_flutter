import 'dart:math';
import 'dart:io';
import 'package:expenses/components/chat.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transactionForm.dart';
import 'package:flutter/cupertino.dart';
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
    final mediaQuery =  MediaQuery.of(context);
    bool islandscape =  mediaQuery.orientation == Orientation.landscape;
    final ios = Platform.isIOS;

  Widget _getIconButtton(IconData icon, Function fn){
      return ios ? 
      GestureDetector( onTap: fn, child: Icon(icon),):
      IconButton(
            icon: Icon(icon),
            onPressed:  fn,
      );

  }
final iconslist = ios ? CupertinoIcons.refresh:   Icons.list;
final iconchart  = ios ? CupertinoIcons.refresh:   Icons.chat;
    final action =  <Widget>[
        _getIconButtton(
             ios ? CupertinoIcons.add :Icons.add,
            () => _openTransactionForModol(context),),
      
     if(islandscape) _getIconButtton(
            swochart ? iconslist: iconchart,
             () {
              setState((){
                swochart = !swochart;
              });
            },),
      ];
    

final PreferredSizeWidget appbar = ios ? 
     CupertinoNavigationBar(
       middle:Text("Despesas pessoal"),
       trailing:Row(
         mainAxisSize: MainAxisSize.min,
         children: action,
       ),
     )
    :
    AppBar(
      title: Text("Despesas pessoal"),
      actions:action,
        );
     

  final availableHeigth = mediaQuery.size.height -
        appbar.preferredSize.height -
        mediaQuery.padding.top;
    
    final page =SafeArea(
      child: SingleChildScrollView(
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
              height: availableHeigth * (islandscape ? 0.8:0.3),
              child: Chart(_recentTransactions),
            ),
            if (!swochart || islandscape)
            Container(
              height: availableHeigth * (islandscape ? 1:0.7),
              child: TransactinList(_transaction, _deleteTransaction),
            ),
          ],
        ),
    ),
    );

    
    
    return  ios ?
     CupertinoPageScaffold(
       navigationBar: appbar,
       child:page , 
     
     )
     : 
     Scaffold(
      appBar: appbar,
      body: page,
      floatingActionButton: ios ?Container():FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionForModol(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
