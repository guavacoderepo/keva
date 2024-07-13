import 'package:keva/constants/index.dart';
import 'package:keva/helpers/index.dart';
import 'package:keva/screens/onboarding/login.dart';

import 'package:keva/utils/index.dart';

import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _played = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..repeat(reverse: false);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    if (!_played) {
      _controller.forward();
      _played = true;
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color101,
      appBar: AppBarClass(context).appbar0(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: SvgPicture.asset(mark),
            ),

            vertical(20),

            TextClass("Account Creates successful!!").header1(15),
            vertical(10),
            TextClass(
                    "Thank you for creating account\nProceed to login page to login to your account.")
                .header0(darkColor, align: TextAlign.center),
            vertical(25),

            // button section

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding21),
              child: ButtonClass(
                  () => pushPageUntil(context, const Login()), "Login"),
            ),
            vertical(20),
          ],
        ),
      ),
    );
  }
}
