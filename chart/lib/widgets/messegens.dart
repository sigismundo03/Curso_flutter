import 'package:chart/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messegens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('chat').orderBy('createdAt', descending: true,).snapshots(),
      builder: (context, chatSnapshots){

        if(chatSnapshots.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );

        }

        final chatDocs = chatSnapshots.data.documents;

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder:  (context, index){
            return MessageBubble(chatDocs[index]['text'] ?? "");
          },
          
          
          
        );
      },
      
    );
  }
}