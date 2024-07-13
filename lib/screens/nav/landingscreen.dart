import 'package:flutter/material.dart';
import 'package:keva/constants/index.dart';
import 'package:keva/screens/account/profile.dart';
import 'package:keva/screens/nav/dashboard.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> screens = [
    const Dashbord(),
    const Dashbord(),
    const Dashbord(),
    const ProfilePage(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: lightColor,
        // elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: appColor),
        unselectedIconTheme: IconThemeData(color: darkColor),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: appColor,
        unselectedItemColor: darkColor,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Account"),
        ],
        onTap: (value) => setState(() => _index = value),
      ),
    );
  }
}
