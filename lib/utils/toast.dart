import 'package:keva/constants/index.dart';
import 'package:flutter/material.dart';

import 'package:toast/toast.dart';

toast(text) => Toast.show(
      text,
      textStyle: const TextStyle(fontSize: 12, color: lightColor),
      duration: Toast.lengthLong,
      gravity: Toast.top,
      backgroundRadius: 10,
    );
