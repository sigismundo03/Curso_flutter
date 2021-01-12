import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('chat').snapshots(),
        builder: (context, snapshot) {

          
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
            child:CircularProgressIndicator(),

            );

          }
          
           final documents = snapshot.data.documents;
          return ListView.builder(
           itemCount: documents.length,
           itemBuilder: (context,index) =>
            Container(
             padding: EdgeInsets.all(9),
             child: Text(documents[index]['text'] ?? ""),
          ),
        
        );
        //  return Center(child: Text(snapshot.data.documents.length.toString()));
        },
         
      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Firestore.instance.collection('chat').add({
            'text':'Adicionado manual mente',
          });
        },
        
      ),
      
    );
  }
}