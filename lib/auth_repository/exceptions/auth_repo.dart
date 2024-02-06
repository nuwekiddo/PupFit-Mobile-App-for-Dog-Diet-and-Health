// // ignore_for_file: prefer_const_constructors, avoid_print, unused_catch_clause
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/state_manager.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   //Variables
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     Future.delayed(Duration(seconds: 6));
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => WelcomeScreen())
//         : Get.offAll(() => HomePage());
//   }

//   Future<String?> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       firebaseUser.value != null
//           ? Get.offAll(() => const HomePage())
//           : Get.to(() => WelcomeScreen());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFail.code(e.code);
//       return ex.message;
//     } catch (_) {
//       final ex = SignUpWithEmailAndPasswordFail();
//       return ex.message;
//     }
//     return null;
//   }

//   Future<String?> loginUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       // ignore: empty_catches
//     } on FirebaseAuthException catch (e) {
//       final ex = LoginWithEmailAndPassWordFail.code(e.code);
//       return ex.message;
//     } catch (_) {
//       final ex = LoginWithEmailAndPassWordFail();
//       return ex.message;
//     }
//     return null;
//   }

//   Future<void> logout() async => await _auth.signOut();
// }
