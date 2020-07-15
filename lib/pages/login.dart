import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppy/pages/home.dart';
import 'package:shoppy/pages/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    IsSigneedIn();
  }

  void IsSigneedIn() async {
    setState(() {
      loading = true;
    });
    FirebaseUser user = await firebaseAuth.currentUser().then((user) {
      if (user != null) {
        setState(() {
          isLoggedIn = true;
        });
      }
    });
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'images/background.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'images/logo.png',
                  width: 150.0,
                  height: 150.0,
                  color: Colors.amber,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.3),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.white.withOpacity(0.9),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: InputBorder.none,
                                      icon: Icon(Icons.email)),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value.isEmpty ||
                                        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                            .hasMatch(value)) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.white.withOpacity(0.9),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: InputBorder.none,
                                      icon: Icon(Icons.lock_outline)),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'the password field cannot be empty';
                                    } else if (value.length < 6) {
                                      return 'the password too short';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.amber,
                              elevation: 0.0,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()));
                                        },
                                        child: Text('Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'forget password ?',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Center(
                                child: Text(
                              'Or',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            )),
                          )),
                          Center(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text(
                                      'Register now',
                                      style: TextStyle(color: Colors.amber),
                                    ))),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Visibility(
                visible: loading ?? true,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
// ignore: non_constant_identifier_names
