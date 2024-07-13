import 'package:flutter/material.dart';
import 'package:keva/http_request/user.dart';
import 'package:keva/screens/onboarding/login.dart';
import 'package:keva/utils/index.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Users()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // app theme data
        theme: theme(),

        // home section
        home: const Login(),
      ),
    ),
  );
}
