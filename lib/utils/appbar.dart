import 'package:flutter/material.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/utils/index.dart';

class AppBarClass {
  late String apptitle;
  late BuildContext context;

  AppBarClass(this.context, {this.apptitle = ""});

  dashboard() => PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          // primary: false,
          backgroundColor: appColor,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextClass('Hi, {Evan}').header5(),
              TextClass('Welcome Back').header5(size: 17),
            ],
          ),

          actions: const [
            Padding(
              padding: EdgeInsets.all(15),
              child: Badge(
                isLabelVisible: true,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: lightColor,
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
      );

  innerpage() => AppBar(
        // primary: false,
        backgroundColor: appColor,
        centerTitle: true,
        title: Text(
          apptitle,
          style: const TextStyle(color: lightColor, fontSize: 14),
        ),

        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: lightColor,
            ),
          ),
        ),
        elevation: 0,
      );

  appbar2() => AppBar(
        // primary: false,
        backgroundColor: transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          apptitle,
          style: TextStyle(
            color: darkColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CircleAvatar(
                  // backgroundColor: color2, child: SvgPicture.asset(back)),
                  )),
        ),
        elevation: 0,
      );

  appbar0() => AppBar(
        // primary: false,
        backgroundColor: transparent,
        automaticallyImplyLeading: false,

        elevation: 0,
      );

  appbar00() => AppBar(
        // primary: false,
        backgroundColor: transparent,
        automaticallyImplyLeading: false,
        // centerTitle: true,

        title: Text(
          apptitle,
          style: TextStyle(color: darkColor, fontSize: 15),
        ),

        elevation: 0,
      );
}
