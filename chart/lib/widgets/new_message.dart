import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controle = TextEditingController();
  String _entermessage =' ';

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
    
    final user = FirebaseAuth.instance.currentUser;
    final userName = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': _entermessage,
      'createdAt': Timestamp.now(),
      'userId':user.uid,
      'userName': userName.get('name'),
      'userImage': userName.get('imageUrl'),
    });
    _controle.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
         
          Expanded(
            child: TextField(
              controller: _controle,
              decoration: InputDecoration(
                labelText: 'Enviar Messsagem',
              ),
              onChanged: (value){
                setState(() {
                  _entermessage = value;
                });
              } ,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
            onPressed: _entermessage.trim().isEmpty ? null:  _sendMessage,
          ),
           IconButton(
            icon: Icon(Icons.file_present),
            color: Theme.of(context).primaryColor,
            onPressed: _entermessage.trim().isEmpty ? null:  _sendMessage,
          ),
        ],
      ),
      
    );
  }
}