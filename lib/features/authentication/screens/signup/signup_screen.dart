// ignore_for_file: prefer_const_constructors
import 'package:dog_care/constants/text_strings.dart';
import 'package:dog_care/features/authentication/screens/signup/signup_footer.dart';
import 'package:dog_care/features/authentication/screens/signup/signup_form.dart';
import 'package:dog_care/features/authentication/screens/signup/signup_header.dart';
import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                SignUpHeaderWidget(
                  image: tWelcomeScreenImg,
                  title: tSignupTitle,
                  subTitle: tSignupSubTitle,
                ),

                //FORM
                SignUpFormWidget(),
                SignUpFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
