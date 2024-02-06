// ignore_for_file: prefer_const_constructors, prefer_equal_for_default_values

import 'package:dog_care/auth_repository/log_in_authrepo.dart';
import 'package:dog_care/auth_repository/sign_up_authrepo.dart';
import 'package:dog_care/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:dog_care/features/core/screens/homepage.dart';
import 'package:dog_care/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpAuthRepoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogInAuthRepoProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dog App',
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        defaultTransition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return HomePage();
            }
            return WelcomeScreen();
          },
        ),
      ),
    );
  }
}
