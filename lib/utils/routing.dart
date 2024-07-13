import 'package:flutter/cupertino.dart';

pushPage(context, route) =>
    Navigator.push(context, CupertinoPageRoute(builder: (context) => route));

pushPageUntil(context, route) => Navigator.pushAndRemoveUntil(context,
    CupertinoPageRoute(builder: (context) => route), (Route r) => false);
