import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppy/pages/home.dart';
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

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      print('hello');
      FirebaseUser user = await firebaseAuth.currentUser().catchError((e) =>
      {
        print(e)
      });
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
        })
            .catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      else {
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.white.withOpacity(0.9),
                              elevation: 0.0,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Male'),
                                      leading: Radio(
                                          value: 'Male',
                                          groupValue: groupValue,
                                          onChanged: (e) => ValueChanged(e)),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Female'),
                                      leading: Radio(
                                          value: 'Female',
                                          groupValue: groupValue,
                                          onChanged: (e) => ValueChanged(e)),
                                    ),
                                  ),
                                ],
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
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.white.withOpacity(0.9),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: ListTile(
                                  title: TextFormField(
                                    obscureText: hidepass,
                                    decoration: InputDecoration(
                                        labelText: 'Confirm',
                                        border: InputBorder.none,
                                        icon: Icon(Icons.lock_outline)),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _confirmpasswordController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'the password field cannot be empty';
                                      } else if (value.length < 6) {
                                        return 'the password too short';
                                      } else if (_passwordController.text !=
                                          value) {
                                        return 'the passwords are not matched';
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.amber,
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
                                              builder: (context) =>
                                                  Register()));
                                    },
                                    child: Text(
                                      'log in',
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
