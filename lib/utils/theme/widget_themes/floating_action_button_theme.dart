// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import

import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class tFloatingActionButtonsTheme {
  tFloatingActionButtonsTheme._();

  static final lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: tWhiteColor,
    backgroundColor: tSecondaryColor,
  );

  static final darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: tSecondaryColor,
    backgroundColor: tWhiteColor,
  );
}
