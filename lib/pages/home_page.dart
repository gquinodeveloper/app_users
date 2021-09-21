import 'package:app_users/pages/detail_page.dart';
import 'package:app_users/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Provider"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return ListView.builder(
      itemCount: userProvider.users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "${userProvider.users[index].firstName} ${userProvider.users[index].firstName}",
          ),
          subtitle: Text(userProvider.users[index].email),
          leading: Hero(
            tag: "tag_${userProvider.users[index].id}",
            transitionOnUserGestures: true,
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(userProvider.users[index].avatar),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  user: userProvider.users[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
