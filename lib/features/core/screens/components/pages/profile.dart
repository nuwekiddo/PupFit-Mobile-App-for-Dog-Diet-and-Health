// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_care/auth_repository/firestore_services.dart';
import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/constants/sizes.dart';
import 'package:dog_care/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:dog_care/features/core/screens/components/profile_update/profile_update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Uri whatsapp = Uri.parse('https://wa.link/zm6mc1');

    return Scaffold(
        body: StreamBuilder(
      stream: FirestoreServices.getUser(FirebaseAuth.instance.currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(tPrimaryColor),
            ),
          );
        } else {
          // Fetch Data
          final data = snapshot.data!.docs[0];

          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Align(
                      alignment: Alignment(-0.5, -0.2),
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: data['imgUrl'] == ''
                                ? Image(
                                    image: AssetImage(
                                      'assets/images/dog3d.png',
                                    ),
                                  )
                                : Image(
                                    image: NetworkImage(
                                      data['imgUrl'],
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                      ),
                    ),
                  ),

                  // Name and Email
                  SizedBox(height: 10),
                  Text("${data['fullName']}",
                      style: Theme.of(context).textTheme.headline4),
                  Text("${data['email']}",
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 20),
                  //EDIT PROFILE
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => UpdateProfile(data: data)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          side: BorderSide.none,
                          shape: StadiumBorder()),
                      child: Text(
                        'Edit Profile',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),

                  //MENU LIST
                  ProfileMenuWidget(
                    title: 'Email Us',
                    icon: PhosphorIcons.envelope,
                    onPress: () {
                      launch('mailto: ajpascua26@gmail.com');
                    },
                  ),
                  ProfileMenuWidget(
                    title: 'Chat with Us',
                    icon: PhosphorIcons.whatsapp_logo,
                    onPress: () async {
                      launch('$whatsapp');
                    },
                  ),
                  ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: tPrimaryColor.withOpacity(0.1)),
                      child: Icon(
                        PhosphorIcons.google_play_logo,
                        color: tPrimaryColor,
                      ),
                    ),
                    title: Text('Support PupFit (Coming Soon)',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.apply(color: tWhiteColor)),
                  ),
                  Divider(color: Colors.grey),
                  ProfileMenuWidget(
                    title: 'Logout',
                    textColor: Colors.red.withOpacity(0.6),
                    icon: PhosphorIcons.sign_out,
                    endIcon: false,
                    onPress: () {
                      FirebaseAuth.instance
                          .signOut()
                          .then((value) => Get.offAll(() => WelcomeScreen()));
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: tPrimaryColor.withOpacity(0.1)),
        child: Icon(
          icon,
          color: tPrimaryColor,
        ),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.headline6?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: Icon(
                LineAwesomeIcons.angle_right,
                size: 20,
                color: Colors.grey.withOpacity(0.1),
              ),
            )
          : null,
    );
  }
}
