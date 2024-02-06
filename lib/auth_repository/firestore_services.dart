import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  static getUser(uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('userUID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }
}
