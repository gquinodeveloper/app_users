import 'dart:convert';

import 'package:app_users/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  UserProvider() {
    this.getusers();
  }

  List<UserModel> users = [];

  getusers() async {
    final url = Uri.https('reqres.in', "/api/users");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      this.users.addAll((jsonData["data"] as List)
          .map((json) => UserModel.fromJson(json))
          .toList());
      /* return (jsonData["data"] as List)
          .map((json) => UserModel.fromJson(json))
          .toList(); */
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    notifyListeners();
  }

  Future<List<UserModel>> getUsersNormal() async {
    final url = Uri.https('reqres.in', "/api/users");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return (jsonData["data"] as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
