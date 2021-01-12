import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messegens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('chat').snapshots(),
      builder: (context, chatSnapshots){

        if(chatSnapshots.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );

        }

        final chatDocs = chatSnapshots.data.documents;

        return ListView.builder(
          itemCount: chatDocs.length,
          itemBuilder:  (context, index){
            return Text(chatDocs[index]['text'] ?? "");
          },
          
          
          
        );
      },
      
    );
  }
}