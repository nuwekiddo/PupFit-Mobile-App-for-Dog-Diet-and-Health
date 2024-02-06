// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
            Text(tOtpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: tFormHeight - 20),
            Text('$tOtpMessage support@coding.com',
                textAlign: TextAlign.center),
            SizedBox(height: tFormHeight),
            OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) => print('OTP is => $code')),
            SizedBox(height: tFormHeight - 10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text(tNext)))
          ],
        ),
      ),
    );
  }
}
