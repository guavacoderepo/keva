import 'dart:convert';
import 'package:keva/constants/index.dart';
// import 'package:keva/models/usermodel.dart';
import 'package:http/http.dart' as http;

class Authentication {
  var client = http.Client();

  // create a acount

  Future<Map> create(Map data) async {
    var apiuri = Uri.parse(baseurl + userEP);

    try {
      var res = await client.post(
        apiuri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(data),
      );

      var json = jsonDecode(res.body);

      if (json["statusCode"] != 400) {
        return {"msg": json["message"], "status": true};
      }

      return {"msg": json["message"], "status": false};
    } finally {
      client.close();
    }
  }

  // login
  Future<Map> login(Map data) async {
    var apiuri = Uri.parse(baseurl + loginEP);

    try {
      var res = await client.post(
        apiuri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(data),
      );

      var json = jsonDecode(res.body);
      print(json);

      if (json["statusCode"] != 401) {
        return {"payload": json, "status": true};
      }

      return {"msg": json["message"], "status": false};
    } finally {
      client.close();
    }
  }
}
