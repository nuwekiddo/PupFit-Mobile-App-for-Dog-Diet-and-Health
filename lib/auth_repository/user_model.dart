import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserModel extends GetxController {
  final String fullName;
  final String email;
  final String password;
  final String userUid;

  UserModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userUid,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      fullName: doc['fullName'],
      email: doc['email'],
      password: doc['password'],
      userUid: doc['userUID'],
    );
  }
}
