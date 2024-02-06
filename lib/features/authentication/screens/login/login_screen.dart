// ignore_for_file: prefer_const_constructors
import 'package:dog_care/constants/image_strings.dart';
import 'package:dog_care/features/authentication/screens/login/login_header.dart';
import 'package:flutter/material.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import 'login_footer.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                LoginHeaderWidget(
                  image: tWelcomeScreenImg,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                //FORM
                LoginForm(),
                LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
