// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors, empty_catches, body_might_complete_normally_nullable

import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInAuthRepoProvider with ChangeNotifier {
  // INVALID KEYWORDS
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(LogInAuthRepoProvider.pattern.toString());

  // USER
  UserCredential? userCredential;

  // Loading
  bool loading = false;

  void logInValidation({
    required TextEditingController? email,
    required TextEditingController? password,
    required BuildContext context,
  }) async {
    // EMAIL EMPTY
    if (email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: tPrimaryColor,
          elevation: 6.0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Please Enter your Email',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      );
    }
    // EMAIL INVALID KEYWORDS
    else if (!regExp.hasMatch(email.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: tPrimaryColor,
          elevation: 6.0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text('Invalid Email Address'),
        ),
      );
      return;
    }
    // PASSWORD EMPTY
    else if (password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: tPrimaryColor,
          elevation: 6.0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Please Enter your Password',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      );
    }
    // PASSWORD 8 CHAR ONLY
    else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: tPrimaryColor,
          elevation: 6.0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Password must be 8 characters',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      );
    }
    // LOGIN TO HOMEPAGE
    else {
      // LOGIN USER
      try {
        loading = true;
        notifyListeners();

        // FETCH USER DATA
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        )
            .then(
          (value) async {
            loading = false;
            notifyListeners();
            await Get.offAll(
              HomePage(),
            );
          },
        );
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          loading = false;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: tPrimaryColor,
              elevation: 6.0,
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              content: Text(
                'User not Found!',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        } else if (e.code == 'wrong-password') {
          loading = false;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: tPrimaryColor,
              elevation: 6.0,
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Wrong Password!',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        }
      }
    }
  }
}
