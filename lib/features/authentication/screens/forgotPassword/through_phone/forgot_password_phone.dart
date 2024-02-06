// // ignore_for_file: prefer_const_constructors
// import 'package:dog_care/constants/image_strings.dart';
// import 'package:dog_care/constants/text_strings.dart';
// import 'package:dog_care/features/authentication/screens/forgotPassword/otp_verification/otp_screen_mail.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/get_core.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// import '../../../../../constants/sizes.dart';
// import '../../signup/signup_header.dart';

// class ForgetPasswordPhoneScreen extends StatelessWidget {
//   const ForgetPasswordPhoneScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(tDefaultSize),
//           child: Column(
//             // ignore: prefer_const_literals_to_create_immutables
//             children: [
//               SizedBox(height: tDefaultSize * 4),
//               FormHeaderWidget(
//                 image: tForgotPasswordImage,
//                 title: tForgetPasswordTitle,
//                 subTitle: tForgetPasswordSubTitle,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 heightBetween: 30.0,
//                 textAlign: TextAlign.center,
//               ),

//               //EQUATOR
//               SizedBox(height: tFormHeight),

//               // EMAIL RECOVERY
//               Form(
//                   child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(
//                       label: Text(tPhoneNum),
//                       hintText: tPhoneNum,
//                       prefixIcon: Icon(Icons.phone_android_rounded),
//                     ),
//                   ),
//                   SizedBox(height: tFormHeight - 10),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           Get.to(() => OTPScreen());
//                         },
//                         child: Text(tNext.toUpperCase())),
//                   )
//                 ],
//               ))
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
