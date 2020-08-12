import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppy/db/users.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  UserServices _userServices = UserServices();
  FirebaseUser _firebaseUser;
  FirebaseAuth _firebaseAuth;

  FirebaseUser get user => _firebaseUser;

  Status get status => _status;
  Status _status = Status.Uninitialized;

  UserProvider.initialize() : _firebaseAuth = FirebaseAuth.instance {
    _firebaseAuth.onAuthStateChanged.listen(_onStatusChanged);
  }

  Future<bool> SignIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> SignUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        Map<String, dynamic> values = {
          'name': name,
          'email': email,
          'userId': user.user.uid,
        };
        _userServices.createUser(values);
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> SignOut() async {
    _firebaseAuth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onStatusChanged(FirebaseUser event) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _firebaseUser = user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
