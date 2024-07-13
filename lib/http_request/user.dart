import 'dart:convert';
import 'package:keva/constants/index.dart';
import 'package:keva/helpers/sharedpref.dart';
import 'package:keva/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future user(context) async {
  var client = http.Client();

  // get user token
  // String refreshToken = await UserAuth(name: "refresh_token").retrivedata();
  String accessToken = await UserAuth(name: "access_token").retrivedata();

  var apiuri = Uri.parse(baseurl + whoami);

  try {
    var res = await client.get(apiuri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });

    var json = jsonDecode(res.body);

    if (json["statusCode"] == 401) {
      return {"msg": json["message"], "status": false};
    }

    UserModel user = UserModel.fromMap(json);

    return {"msg": json["msg"], "payload": user, "status": true};
  } finally {
    client.close();
  }
}

class Users extends ChangeNotifier {
  UserModel _user = UserModel();

  UserModel get user => _user;

  // call user function
  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
