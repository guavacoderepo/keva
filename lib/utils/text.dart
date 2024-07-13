import 'package:keva/constants/index.dart';
import 'package:flutter/material.dart';

class TextClass {
  late String text;
  TextClass(this.text);

  Text header1(double x, {String font = "inter"}) => Text(
        text,
        style: TextStyle(
          color: darkColor,
          fontSize: x,
          fontWeight: FontWeight.w700,
          fontFamily: font,
        ),
      );

  Text header2() => Text(
        text,
        style: TextStyle(
          color: darkColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );

  Text header3({double size = 12, Color color = const Color(0XFF333333)}) =>
      Text(
        text,
        style: TextStyle(
          color: color.withOpacity(0.8),
          fontSize: size,
          fontWeight: FontWeight.w400,
        ),
      );

  Text header4({Color color = Colors.black}) => Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );

  Text header5({Color color = Colors.white, double size = 14}) => Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w500,
        ),
      );

  Text header6({double size = 8}) => Text(
        text,
        style: TextStyle(
          color: darkColor,
          fontSize: size,
          fontWeight: FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      );

  Text header0(Color color,
          {double size = 12, TextAlign align = TextAlign.left}) =>
      Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      );

  Text ios(Color color, {double size = 12}) => Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w400,
          height: 1.5,
          fontFamily: "inter",
        ),
      );
}
