// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_field, camel_case_types

import 'package:dog_care/auth_repository/sign_up_authrepo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  // final _phoneNo = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpAuthRepoProvider signUpAuthRepoProvider =
        Provider.of<SignUpAuthRepoProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: tFormHeight),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Input FullName
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _fullName,
              decoration: InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            SizedBox(height: tFormHeight),

            //Input Email
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            SizedBox(height: tFormHeight),
            //Input Password
            TextFormField(
              controller: _password,
              decoration: InputDecoration(
                  label: Text(tPassword),
                  prefixIcon: Icon(Icons.fingerprint_rounded)),
            ),
            SizedBox(height: tFormHeight),

            //SignUp Button
            Column(
              children: [
                signUpAuthRepoProvider.loading == false
                    ? signInButton(
                        onPressed: () {
                          signUpAuthRepoProvider.signUpValidation(
                            fullName: _fullName,
                            email: _email,
                            password: _password,
                            context: context,
                          );
                        },
                        tText: tSignUp.toUpperCase(),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class signInButton extends StatelessWidget {
  const signInButton({
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
