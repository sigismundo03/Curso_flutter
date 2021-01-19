import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _entermessage =' ';

  void _sendMessage(){
    FocusScope.of(context).unfocus();

    Firestore.instance.collection('chat').add({
      'text': _entermessage,
      'createdAt': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
         
          Expanded(
            child: TextField(
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