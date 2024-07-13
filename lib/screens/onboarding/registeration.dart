import 'package:keva/helpers/index.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/http_request/auth.dart';
import 'package:keva/screens/onboarding/login.dart';
import 'package:keva/screens/onboarding/success.dart';
import 'package:keva/utils/index.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // dummy section

  bool vis1 = true;
  bool vis2 = true;

  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController pwd1ctr = TextEditingController();
  TextEditingController pwd2ctr = TextEditingController();

  @override
  void initState() {
    ToastContext().init(context);
    super.initState();
  }

  @override
  void dispose() {
    pwd1ctr.dispose();
    pwd2ctr.dispose();
    namectr.dispose();
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
                TextClass("Create Account").header1(30),
                // text field section

                vertical(50),

                TextClass("Full Name").header3(),
                vertical(10),

                // text section
                shadowText(
                  TextFormField(
                    controller: namectr,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(hintText: "John Deo"),
                    keyboardType: TextInputType.name,
                  ),
                ),
                vertical(20),

                TextClass("Email Address").header3(),
                vertical(10),

                // text section
                shadowText(
                  TextFormField(
                    controller: emailctr,
                    style: const TextStyle(fontSize: 12),
                    decoration:
                        const InputDecoration(hintText: "name@agency.com.ng"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                vertical(20),

                TextClass("Your Password").header3(),
                vertical(10),

                // text section
                shadowText(
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    controller: pwd1ctr,
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
                vertical(20),
                TextClass("Confirm Password").header3(),
                vertical(10),

                // text section
                shadowText(
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    controller: pwd2ctr,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() => vis2 = !vis2);
                        },
                        child: Icon(
                          vis2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 22,
                        ),
                      ),
                      hintText: "************",
                    ),
                    obscuringCharacter: "*",
                    obscureText: vis2,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),

                // button section
                vertical(20),

                ButtonClass(() async {
                  bool check = checkEmpty(
                    [emailctr.text, namectr.text, pwd2ctr.text, pwd1ctr.text],
                  );

                  if (!check) {
                    return toast("Empty fields, please fill all ");
                  }

                  Map reqdata = {
                    "email": emailctr.text.trim(),
                    "name": namectr.text.trim(),
                    "avatar":
                        "https://i.pinimg.com/564x/0e/9b/ce/0e9bceffda12d948ebe741b5b25dcc16.jpg",
                    "password": pwd1ctr.text.trim()
                  };

                  if (pwd1ctr.text != pwd2ctr.text) {
                    return toast("Password mismatch!!!");
                  }

                  LoadingClass().iosLoader(context);

                  await Authentication().create(reqdata).then((res) {
                    if (!res["status"]) {
                      Navigator.pop(context);
                      return toast(res["msg"].toString());
                    }

                    pushPageUntil(context, const Success());
                  });

                  // end here
                }, "Next"),

                // already have account section

                vertical(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextClass("Already have an account? ").header0(darkColor),
                    GestureDetector(
                      onTap: () => pushPage(context, const Login()),
                      child: TextClass("Login").header0(appColor),
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
}
