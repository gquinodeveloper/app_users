import 'package:app_users/models/user_model.dart';
import 'package:app_users/providers/user_provider.dart';
import 'package:flutter/material.dart';

class HomePageTemporal extends StatefulWidget {
  @override
  _HomePageTemporalState createState() => _HomePageTemporalState();
}

class _HomePageTemporalState extends State<HomePageTemporal> {
  UserProvider _provider = UserProvider();
  List<UserModel> _users = [];

  @override
  void initState() {
    loadUsers();
    super.initState();
  }

  void loadUsers() async {
    _users = await _provider.getUsersNormal();
    print("Termine de obtener info");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Dibujando Widget");
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          //final user = _users[index];
          return ListTile(
            title: Text(
              "${_users[index].firstName} ${_users[index].firstName}",
            ),
            subtitle: Text(_users[index].email),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
