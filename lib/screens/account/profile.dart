import 'package:flutter/material.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/utils/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarClass(context).dashboard(),
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
                        backgroundImage: const NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmlfDMANvrYSMZw1Zj3oFQLjqrO-T2dK6nw&usqp=CAU",
                        ),
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
                      TextClass("Grace Jane").header1(14),
                      TextClass("grace1122@gmail.com").header3(size: 13),
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
}
