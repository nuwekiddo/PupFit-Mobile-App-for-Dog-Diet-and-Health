// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unused_local_variable, camel_case_types, prefer_final_fields, override_on_non_overriding_member
import 'package:dog_care/auth_repository/log_in_authrepo.dart';
import 'package:dog_care/features/authentication/screens/forgotPassword/other_options/forgot_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  bool passwordHidden = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LogInAuthRepoProvider logInAuthRepoProvider =
        Provider.of<LogInAuthRepoProvider>(context);

    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight),
      //LOGIN FORM
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: tEmail,
              hintText: tEmail,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: tFormHeight,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: passwordHidden,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordHidden = !passwordHidden;
                  });
                },
                icon: Icon(passwordHidden
                    ? PhosphorIcons.eye_closed
                    : PhosphorIcons.eye),
              ),
              prefixIcon: Icon(Icons.fingerprint_outlined),
              labelText: tPassword,
              hintText: tPassword,
              border: OutlineInputBorder(),
            ),
          ),

          //FORGOT PASSWORD BUTTON
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ForgotPasswordScreen.buildShowModalBottomSheet(context);
              },
              child: Text(tForgetPassword),
            ),
          ),

          //EQUATOR
          SizedBox(height: tFormHeight - 20),

          //LOGIN BUTTON
          Column(
            children: [
              logInAuthRepoProvider.loading == false
                  ? logInButton(
                      onPressed: () {
                        logInAuthRepoProvider.logInValidation(
                            email: _emailController,
                            password: _passwordController,
                            context: context);
                      },
                      tText: tLogin.toUpperCase(),
                    )
                  : Center(child: CircularProgressIndicator())
            ],
          )
        ],
      ),
    ));
  }
}

class logInButton extends StatelessWidget {
  const logInButton({
    Key? key,
    required this.onPressed,
    required this.tText,
  }) : super(key: key);

  final void Function() onPressed;
  final String tText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(tText),
      ),
    );
  }
}
