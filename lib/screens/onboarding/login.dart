import 'package:keva/helpers/index.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/helpers/sharedpref.dart';
import 'package:keva/http_request/auth.dart';
import 'package:keva/http_request/user.dart';
import 'package:keva/screens/nav/landingscreen.dart';
import 'package:keva/screens/onboarding/registeration.dart';
import 'package:keva/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // dummy section

  bool vis1 = true;

  TextEditingController pwdctr = TextEditingController();
  TextEditingController emailctr = TextEditingController();

  @override
  void initState() {
    ToastContext().init(context);
    super.initState();
  }

  @override
  void dispose() {
    pwdctr.dispose();
    emailctr.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar section
      appBar: AppBarClass(context).appbar0(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // spacer
                // vertical(5),
                // text class
                TextClass("Login").header1(30),
                // text field section

                vertical(50),

                TextClass("Email Address").header3(),
                vertical(10),

                // text section
                shadowText(
                  TextFormField(
                    controller: emailctr,
                    style: const TextStyle(fontSize: 12),
                    decoration:
                        const InputDecoration(hintText: "name@agency.com.ng"),
                    keyboardType: TextInputType.name,
                  ),
                ),
                vertical(20),

                // forgot passwrod secton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextClass("Your Password").header3(),
                    GestureDetector(
                      // onTap: () => pushPage(context, const ForgotPwd()),
                      child:
                          TextClass("Forget your password?").header0(darkColor),
                    )
                  ],
                ),

                vertical(10),

                // text section
                shadowText(
                  TextFormField(
                    controller: pwdctr,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() => vis1 = !vis1);
                        },
                        child: Icon(
                          vis1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 22,
                        ),
                      ),
                      hintText: "************",
                    ),
                    obscuringCharacter: "*",
                    obscureText: vis1,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                // button section
                vertical(20),

                ButtonClass(() async {
                  bool check = checkEmpty([emailctr.text, pwdctr.text]);

                  if (!check) {
                    return toast("Empty fields, please fill all ");
                  }

                  Map reqdata = {
                    "email": emailctr.text.trim(),
                    "password": pwdctr.text.trim()
                  };

                  LoadingClass().iosLoader(context);

                  await Authentication().login(reqdata).then((res) async {
                    if (!res["status"]) {
                      Navigator.pop(context);
                      return toast(res["msg"].toString());
                    }

                    Map rx = res["payload"];

                    await UserAuth(name: "access_token")
                        .savedate(rx["access_token"]);
                    await UserAuth(name: "refresh_token")
                        .savedate(rx["refresh_token"])
                        .then((value) => getUser());

                    // Provider.of<Users>(context, listen: false).setUser(user);
                  });

                  // pushPageUntil(context, const LandingPage());
                }, "Next"),

                // already have account section

                vertical(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextClass("Don't have an account? ").header0(darkColor),
                    GestureDetector(
                      onTap: () => pushPage(context, const Register()),
                      child: TextClass("Sign up").header0(appColor),
                    )
                  ],
                ),

                vertical(20),
                // here for more
              ],
            ),
          ),
        ),
      ),
    );
  }

  getUser() async {
    await user(context).then((res) async {
      if (!res["status"]) {
        Navigator.pop(context);
        return toast(res["msg"].toString());
      }

      //

      //

      Provider.of<Users>(context, listen: false).setUser(res["payload"]);

      

    });
  }
}
