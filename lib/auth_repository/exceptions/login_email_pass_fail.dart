// class LoginWithEmailAndPassWordFail {
//   final String message;

//   LoginWithEmailAndPassWordFail([this.message = "An Unknown error occured."]);

//   factory LoginWithEmailAndPassWordFail.code(String code) {
//     switch (code) {
//       case 'weak_password':
//         return LoginWithEmailAndPassWordFail(
//             "The Password you entered doesn't meet the minimum security requirements.");
//       case 'invalid_email':
//         return LoginWithEmailAndPassWordFail(
//             'The email you entered is invalid or badly formatted.');
//       case 'email_already_in_use':
//         return LoginWithEmailAndPassWordFail(
//             'The email you entered is invalid or already taken.');
//       case 'operations_not_allowed':
//         return LoginWithEmailAndPassWordFail(
//             'Operation is not allowed or error. Please contact support.');
//       case 'user-disabled':
//         return LoginWithEmailAndPassWordFail(
//             'The user has been disbled. Please contact the support for futher concerns.');
//       default:
//         return LoginWithEmailAndPassWordFail();
//     }
//   }
// }
