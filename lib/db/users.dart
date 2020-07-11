import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  String ref = 'users';

  createUser(Map value) {
    _firebaseDatabase
        .reference()
        .child(ref)
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
