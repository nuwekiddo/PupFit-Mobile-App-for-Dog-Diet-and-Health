// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, unused_local_variable, avoid_print

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dog_care/features/core/screens/components/pages/calendar.dart';
import 'package:dog_care/features/core/screens/components/pages/dashboard.dart';
import 'package:dog_care/features/core/screens/components/pages/profile.dart';
import 'package:dog_care/features/core/screens/components/pages/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../../constants/colors.dart';

// // CALLING USER MODEL CLASS
// late UserModel userModel;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // // FETCH DATA INSIDE USERS
  // Future getCurrentUserDataFunction() async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       userModel = UserModel.fromDocument(documentSnapshot);
  //     } else {
  //       print('Document does not exist in the database');
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  int _bottomnavIndex = 0;

  //Pages
  List<Widget> pages = [
    Dashboard(),
    Services(),
    Calendar(),
    Profile(),
  ];

  //Icons
  List<IconData> iconList = [
    PhosphorIcons.house,
    PhosphorIcons.paw_print,
    PhosphorIcons.calendar,
    PhosphorIcons.user
  ];

  //Title
  List<String> titleList = [
    'Dashboard',
    'Services',
    'Calendar',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //DarkMode Properties
    var mediaQuery = MediaQuery.of(context);
    var brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkMode = brightness == Brightness.dark;
    // getCurrentUserDataFunction();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomnavIndex],
                style: Theme.of(context).textTheme.headline1),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomnavIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 65,
        elevation: 0,
        splashColor: tPrimaryColor.withOpacity(.5),
        backgroundColor: Colors.transparent,
        activeColor: tPrimaryColor,
        inactiveColor: isDarkMode ? tWhiteColor : tSecondaryColor,
        icons: iconList,
        iconSize: 30,
        activeIndex: _bottomnavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomnavIndex = index;
          });
        },
      ),
    );
  }
}
