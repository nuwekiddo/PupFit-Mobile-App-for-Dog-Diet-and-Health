// class SignUpWithEmailAndPasswordFail {
//   final String message;

//   SignUpWithEmailAndPasswordFail([this.message = "An Unknown error occured."]);

//   factory SignUpWithEmailAndPasswordFail.code(String code) {
//     switch (code) {
//       case 'weak_password':
//         return SignUpWithEmailAndPasswordFail(
//             "The Password you entered doesn't meet the minimum security requirements.");
//       case 'invalid_email':
//         return SignUpWithEmailAndPasswordFail(
//             'The email you entered is invalid or badly formatted.');
//       case 'email_already_in_use':
//         return SignUpWithEmailAndPasswordFail(
//             'The email you entered is invalid or already taken.');
//       case 'operations_not_allowed':
//         return SignUpWithEmailAndPasswordFail(
//             'Operation is not allowed or error. Please contact support.');
//       case 'user-disabled':
//         return SignUpWithEmailAndPasswordFail(
//             'The user has been disbled. Please contact the support for futher concerns.');
//       default:
//         return SignUpWithEmailAndPasswordFail();
//     }
//   }
// }
