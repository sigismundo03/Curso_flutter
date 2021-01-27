import 'package:chart/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messegens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user =  FirebaseAuth.instance.currentUser;
        return  StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true,).snapshots(),
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
              return MessageBubble(
                chatDocs[index].get('text') ?? "",
                chatDocs[index].get('userId') ==  user.uid,
                chatDocs[index].get('userName'),
                chatDocs[index].get('userImage'),                
                key: ValueKey(chatDocs[index].documentID),
                
                );
            },
            
            
            
          );
        },
        
      );
  }
}