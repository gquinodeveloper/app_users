import 'package:app_users/models/user_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Detail"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "tag_${user.id}",
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(user.avatar),
            ),
          ),
          SizedBox(height: 10.0),
          Text("User: ${user.firstName} ${user.lastName}"),
          Divider(),
          Text("Email: ${user.email}"),
        ],
      ),
    );
  }
}
