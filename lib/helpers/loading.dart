import 'package:keva/constants/index.dart';
import 'package:flutter/cupertino.dart';

class LoadingClass {
  iosLoader(context) => showCupertinoDialog(
        context: context,
        builder: (context) => const CupertinoActivityIndicator(
          radius: 18,
          color: appColor,
        ),
      );
}
