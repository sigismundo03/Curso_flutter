import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chat"),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              
              ),
              items: [
                DropdownMenuItem(
                value: 'Logout',
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8,),
                      Text('Sair'),
                    ],
                  ),
                ),

                ),
              ],
              onChanged: (item) {
                if(item == 'Logout'){
                  FirebaseAuth.instance.signOut();
                }
              },
              
            ),
          ),
        ],
      ),
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