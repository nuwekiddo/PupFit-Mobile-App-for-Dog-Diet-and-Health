// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../through_mail/forgot_password_mail.dart';
import 'forgot_password_button.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: size.height * 0.3,
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle,
                style: Theme.of(context).textTheme.headline2),
            Text(tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: tDefaultSize),

            // RESET VIA EMAIL
            ForgotPasswordButton(
              btnIcon: Icons.mail_lock_rounded,
              title: tEmail,
              subTitle: tResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => ForgetPasswordMailScreen());
              },
            ),

            //EQUILIBRIUM
            SizedBox(height: 20.0),

            // RESET VIA PHONE
            // ForgotPasswordButton(
            //   btnIcon: Icons.phone_iphone_rounded,
            //   title: tPhoneNum,
            //   subTitle: tResetViaPhone,
            //   onTap: () {
            //     Navigator.pop(context);
            //     Get.to(() => ForgetPasswordPhoneScreen());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
