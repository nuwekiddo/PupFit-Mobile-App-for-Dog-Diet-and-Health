// ignore_for_file: prefer_const_constructors

import 'package:dog_care/constants/sizes.dart';
import 'package:dog_care/constants/text_strings.dart';
import 'package:dog_care/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('OR'),
        SizedBox(height: tFormHeight - 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Get.off(() => LoginScreen()),
              child: Text.rich(
                TextSpan(
                  text: tAlreadyHaveAnAccount,
                  style: Theme.of(context).textTheme.bodyText1,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextSpan(
                      text: tLogin,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
