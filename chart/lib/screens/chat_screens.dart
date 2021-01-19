import 'package:chart/widgets/messegens.dart';
import 'package:chart/widgets/new_message.dart';
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
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messegens(),
            
            ),
            NewMessage(),
          ],
        ),
      ),
      
      
    );
  }
}