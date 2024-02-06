// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_care/constants/colors.dart';
import 'package:dog_care/features/core/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAuthRepoProvider with ChangeNotifier {
  // INVALID KEYWORDS
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(SignUpAuthRepoProvider.pattern.toString());

  // USER
  UserCredential? userCredential;

  // Loading
  bool loading = false;

  void signUpValidation({
    required TextEditingController? fullName,
    required TextEditingController? email,
    required TextEditingController? password,
    required BuildContext context,
  }) async {
    // FULL NAME EMPTY
    if (fullName!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: tPrimaryColor,
          elevation: 6.0,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: Text('Please enter your Full Name'),
        ),
      );
      return;
    }
    // EMAIL EMPTY
    else if (email!.text.trim().isEmpty) {
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
    else if (password.text.length <= 8) {
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
    // SIGNUP TO HOMEPAGE
    else {
      // CREATE USER
      try {
        loading = true;
        notifyListeners();
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        // STORE USER DATA
        loading = true;
        notifyListeners();
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential!.user!.uid)
            .set(
          {
            "fullName": fullName.text,
            "email": email.text,
            "password": password.text,
            "userUID": userCredential!.user!.uid,
            'imgUrl': '',
          },
        ).then((value) {
          loading = false;
          notifyListeners();
          Get.offAll(() => HomePage());
        });

        // EXCEPTION
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();
        if (e.code == 'weak-pasword') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: tPrimaryColor,
              elevation: 6.0,
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Password is too weak',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: tPrimaryColor,
              elevation: 6.0,
              duration: Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Email is already in use. Please enter a new one.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        }
      }
    }
  }
}
