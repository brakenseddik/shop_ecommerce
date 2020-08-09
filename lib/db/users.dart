import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  Firestore _firestore = Firestore.instance;
  String ref = 'users';

  createUser(Map data) {
    _firestore
        .collection(ref)
        .document(data['userId'])
        .setData(data)
        .catchError((e) => {print(e.toString())});
  }
}
