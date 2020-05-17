import 'package:crud/models/user.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {
  final User user;

  UserTitle(this.user);

  @override
  Widget build(BuildContext context) {
    final avata = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
      leading: avata,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.User_Form, arguments: user);
              },
              color: Colors.orange,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
