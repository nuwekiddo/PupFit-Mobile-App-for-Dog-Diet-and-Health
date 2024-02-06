// import 'package:dog_final/src/repository/auth_repository/auth_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();

// //Textfields controller to get data grom textfields
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNo = TextEditingController();

// //Function to be called on design to do the job
//   void registerUser(String email, String password) {
//     String? error = AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, password) as String?;
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(
//         message: error.toString(),
//       ));
//     }
//   }
// }
