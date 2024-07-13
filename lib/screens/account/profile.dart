import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/helpers/sharedpref.dart';
import 'package:keva/http_request/user.dart';
import 'package:keva/models/usermodel.dart';
import 'package:keva/screens/onboarding/login.dart';
import 'package:keva/utils/index.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<Users>(context).user;
    return Scaffold(
      appBar: AppBarClass(context, apptitle: user.name!).dashboard(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
// image and username section
              vertical(10),

              Row(
                children: [
// profile picture section
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: lightGrey.withOpacity(0.1),
                        radius: 60,
                        backgroundImage: NetworkImage(
                          user.avatar ?? "",
                        ),
                        onBackgroundImageError: (_, __) {
                          // handle the error to display a placeholder
                        },
                        child: user.avatar == null || user.avatar!.isEmpty
                            ? Image.asset(
                                'assets/placeholder.png',
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),

//  add camera icon for changing image
                      Positioned(
                        top: 70,
                        left: 90,
                        child: CircleAvatar(
                          backgroundColor: lightColor,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: darkColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  horizontal(10),
// name and email section

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextClass(user.name!).header1(14),
                      TextClass(user.email!).header3(size: 13),
                      TextButton(
                        style: TextButton.styleFrom(backgroundColor: appColor),
                        onPressed: () {},
                        child: TextClass("Edit Profile")
                            .header4(color: lightColor),
                      )
                    ],
                  ),
                  horizontal(10)
                ],
              ),
// // become a tutor
//               vertical(18),
//               TextClass("Become a tutor"),
// preference section
              vertical(18),

              ListTile(
                title: TextClass("Payment options").header3(size: 14),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),

              ListTile(
                title: TextClass("Address").header3(size: 14),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),

              ListTile(
                title: TextClass("Share Keva app").header3(size: 14),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              ListTile(
                title: TextClass("About Keva").header3(size: 14),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              ListTile(
                title: TextClass("Help & support").header3(size: 14),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              ListTile(
                title: TextClass("FAQs").header3(size: 14),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              ListTile(
                onTap: () => logoutModal(),
                //
                title:
                    TextClass("Sign out").header3(size: 14, color: Colors.red),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.red,
                ),
              ),

// add contents here
            ],
          ),
        ),
      ),
    );
  }

  void logoutModal() => showCupertinoModalPopup(
        barrierDismissible: false,
        context: (context),
        builder: (context) => CupertinoAlertDialog(
            title: const Text(
              "Logout Action!!",
              style: TextStyle(fontFamily: "inter", fontSize: 14),
            ),
            content: Column(
              children: [
                vertical(10),
                const Text(
                  "Are sure you want to logout??",
                  style: TextStyle(fontFamily: "inter", fontSize: 12),
                ),
                vertical(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonActionClass(() async {
                      Navigator.pop(context);
                      await UserAuth(name: "access_token").removedata();
                      await UserAuth(name: "refresh_token")
                          .removedata()
                          .then((_) => pushPageUntil(context, const Login()));
                    }, "Logout", lightColor, Colors.red),
                    ButtonActionClass(() => Navigator.pop(context), "Cancel",
                        appColor, lightColor),
                  ],
                )
              ],
            )),
      );
}
