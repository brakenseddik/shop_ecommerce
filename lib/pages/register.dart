import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppy/db/auth.dart';
import 'package:shoppy/pages/home.dart';
import 'package:shoppy/pages/login.dart';
import 'package:shoppy/utils/package.dart';
import '../db/users.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  String gender;
  String groupValue = 'Male';

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  bool hidepass = true;

  Auth auth = Auth();

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      print('hello');
      FirebaseUser user =
          await firebaseAuth.currentUser().catchError((e) => {print(e)});
      if (user == null) {
        print('user is Null');
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((user) {
          print('user signed in storing in db');
          _userServices.createUser({
            "username": _nameController.text,
            "email": _emailController.text,
            "userId": user.user.uid,
            "gender": gender,
          });
        }).catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print('user already exist\nSigning Out');
        firebaseAuth.signOut();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'images/logo.png',
                            color: deepOrange,
                            width: 120.0,
//                height: 240.0,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: grey.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'name',
                                  border: InputBorder.none,
                                  icon: Icon(Icons.person)),
                              keyboardType: TextInputType.emailAddress,
                              controller: _nameController,
                              validator: (value) {
                                if (value.length < 6) {
                                  return 'Enter a  name';
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
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey.withOpacity(0.5),
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
                                    !RegExp(
                                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
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
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                obscureText: hidepass,
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
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidepass = false;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Material(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.deepOrange,
                          elevation: 0.0,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: MaterialButton(
                                onPressed: () async {
                                  print('hi');
                                  validateForm();
                                },
                                minWidth: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Text('Register',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  'Already have an account ?',
                                  style: TextStyle(color: deepOrange),
                                ))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Or Sign Up with",
                              style: TextStyle(fontSize: 20, color: grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(
                              color: deepOrange,
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                                child: MaterialButton(
                                    onPressed: () {},
                                    child: Image.asset(
                                      "images/facebook.png",
                                      //width: 60,
                                      height: 50,
                                    ))),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                            child: Material(
                                child: MaterialButton(
                                    onPressed: () async {
                                      FirebaseUser user =
                                      await auth.googleSignIn();
                                      if (user == null) {
                                        _userServices.createUser({
                                          'name': user.displayName,
                                          'picture': user.photoUrl,
                                          'email': user.email,
                                          'userId': user.uid
                                        });
                                        changeScreenReplacement(
                                            context, HomePage());
                                      }
                                    },
                                    child: Image.asset(
                                      "images/google.png",
                                      width: 50,
                                      height: 50,
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  )),
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

  ValueChanged(e) {
    if (e == 'Male') {
      groupValue = e;
      gender = e;
    } else if (e == 'Female') {
      groupValue = e;
      gender = e;
    }
  }
}
