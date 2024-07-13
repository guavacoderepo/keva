import 'package:flutter/material.dart';
import '../constants/index.dart';

ThemeData theme() => ThemeData(
      splashColor: transparent,
      highlightColor: transparent,
      hoverColor: transparent,
      hintColor: transparent,
      scaffoldBackgroundColor: lightColor,
      fontFamily: "inter",
      // input field section

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: hintTextColor, fontSize: 13),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: lightGrey),
        ),
      ),

      // dropdown section
      dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          isCollapsed: true,

          // contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
        ),
      ),
    );

shadowText(Widget child) => Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the text field
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color(0X20293A0F).withOpacity(.04),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
