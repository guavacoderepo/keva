import 'package:flutter/material.dart';
import 'package:keva/constants/index.dart';
import '../utils/index.dart';

class ButtonClass extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  const ButtonClass(this.callback, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: appColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: lightColor,
              offset: Offset(1, 2),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
        width: MediaQuery.of(context).size.width,
        child: Center(child: TextClass(title).header5()),
      ),
    );
  }
}

class ButtonFillClass extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  const ButtonFillClass(this.callback, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: lightColor,
          border: Border.all(color: appColor),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
        width: MediaQuery.of(context).size.width,
        child: Center(child: TextClass(title).header5(color: lightColor)),
      ),
    );
  }
}

class ButtonSmallClass extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Color color;
  const ButtonSmallClass(this.callback, this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        // width: MediaQuery.of(context).size.width * 0.1,
        child: Center(child: TextClass(title).header6(size: 10)),
      ),
    );
  }
}

class ButtonActionClass extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Color bgcolor;
  final Color btcolor;
  const ButtonActionClass(this.callback, this.title, this.btcolor, this.bgcolor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          border: Border.all(color: lightOrange),
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            color: btcolor,
            fontFamily: "inter",
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
