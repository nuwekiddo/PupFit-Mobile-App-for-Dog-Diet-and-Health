// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class tBottomNavigationBarTheme {
  tBottomNavigationBarTheme._();

  // ignore: prefer_const_constructors
  static final lightNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: tSecondaryColor,
  );

  // ignore: prefer_const_constructors
  static final darkNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: tWhiteColor,
  );
}
