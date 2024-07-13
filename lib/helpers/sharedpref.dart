import 'package:shared_preferences/shared_preferences.dart';

class UserAuth {
  String name;

  UserAuth({required this.name});

  // save user shared data
  Future savedate(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(name, token);
  }

  // retrive shared data
  Future<String> retrivedata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(name) ?? "null";
    // print(token);
    return token;
  }

// delete users shered data
  Future removedata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);
  }
}
