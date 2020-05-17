import 'package:crud/componets/user_title.dart';
import 'package:crud/provader/user.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Users user = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuario"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.User_Form
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: user.count,
        itemBuilder: (ctx, index) => UserTitle(user.byindex(index)),
      ),
    );
  }
}
