import 'dart:convert';
import 'package:keva/constants/index.dart';
import 'package:keva/helpers/sharedpref.dart';
import 'package:keva/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future user(context) async {
  var client = http.Client();

  // get user token
  String token = await UserAuth(name: "Token").retrivedata();

  var apiuri = Uri.parse(baseurl + whoami);

  try {
    var res = await client.get(apiuri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var json = jsonDecode(res.body);

    // print(json);

    if (json["status"] != "OK") {
      return {"msg": json["msg"], "status": false};
    }

    UsersModel user = UsersModel.fromMap(json["payload"]);

    return {"msg": json["msg"], "payload": user, "status": true};
  } finally {
    client.close();
  }
}

class Users extends ChangeNotifier {
  UsersModel _user = UsersModel();

  UsersModel get user => _user;

  // call user function
  void setUser(UsersModel user) {
    _user = user;
    notifyListeners();
  }
}
