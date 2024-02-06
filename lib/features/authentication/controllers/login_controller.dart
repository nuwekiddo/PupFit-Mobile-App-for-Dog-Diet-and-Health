// import 'package:flutter/cupertino.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// import '../../../repository/auth_repository/auth_repo.dart';

// class LogInController extends GetxController {
//   static LogInController get instance => Get.find();

//   //TextField Controllers to get data from TextFields
//   final email = TextEditingController();
//   final password = TextEditingController();

//   //Call this Function from Design & it will do the rest
//   Future<void> loginUser(String email, String password) async {
//     String? error = await AuthenticationRepository.instance
//         .loginUserWithEmailAndPassword(email, password);
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(
//         message: error.toString(),
//       ));
//     }
//   }
// }
