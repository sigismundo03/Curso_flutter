import 'package:crud/componets/user_title.dart';
import 'package:crud/data/dummy_user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = {...DUMMY_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuario"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (ctx, index) => UserTitle(user.values.elementAt(index)),
      ),
    );
  }
}
