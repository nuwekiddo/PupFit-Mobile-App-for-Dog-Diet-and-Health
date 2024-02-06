// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:dog_care/constants/text_strings.dart';
import 'package:dog_care/features/authentication/screens/forgotPassword/widget/otp_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: tDefaultSize * 3),
              ThroughEmailWidget(
                image: tForgotPasswordImage,
                title: tForgetPasswordTitle,
                subTitle: tForgetPasswordSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30.0,
                textAlign: TextAlign.center,
              ),

              //EQUATOR
              SizedBox(height: tFormHeight),

              // EMAIL RECOVERY
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      label: Text(tEmail),
                      hintText: tEmail,
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),
                  SizedBox(height: tFormHeight - 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: _email.text);
                          Get.back();
                        },
                        child: Text(tNext.toUpperCase())),
                  )
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
