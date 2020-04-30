import 'dart:io';

import 'package:agendamentosqlite/helpers/database_helper.dart';
import 'package:agendamentosqlite/models/contado.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  DatabaseHelper db = DatabaseHelper();
  List<Contato> contatos = List<Contato>();


  @override
  void initState(){
    super.initState();
    
    db.getContatos().then((lista){
      setState((){
        contatos = lista;
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: contatos.length,
        itemBuilder: (context,index){
          return  _listaCantatos(context,index);
        },
        ),

      backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
          
          ),
    );
  }
  _listaCantatos(BuildContext context,int index){
    return GestureDetector(
        child: Card(
          child: Padding(padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: contatos[index].imagem != null ?
                        FileImage(File(contatos[index].imagem)):
                        AssetImage("imagem/sigis.jpg"), 
                      
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(contatos[index].nome ?? "",
                          style: TextStyle(fontSize: 20),
                         ),
                         Text(contatos[index].email ?? "",
                          style: TextStyle(fontSize: 20),
                         ),
                      ],
                    ),
                  
                  ), 
                ],
              ),

          
          ),
        ),
    );
  }
}
