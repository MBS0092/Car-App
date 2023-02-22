import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'UserModel.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
  }

  clearText() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, 'LoginPage');
          },
        ),*/
        elevation: 0,
      ),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 300),
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 100),
            width: double.infinity,
            height: 650,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                  ),
                ]),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Car Manager',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 44.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 0, right: 0),
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Name',
                                    prefixIcon: Icon(Icons.person),
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent, fontSize: 15),
                                  ),
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Name';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent, fontSize: 15),
                                  ),
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    } else if (!value.contains('@')) {
                                      return 'Please Enter Valid Email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  autofocus: false,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.key),
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent, fontSize: 15),
                                  ),
                                  controller: passwordController,
                                  validator: (value) {
                                    RegExp regx = new RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return 'Please Enter required Password';
                                    }
                                    if (!regx.hasMatch(value)){
                                      return("Enter Valid Password(Min. 6 Character)");
                                    }
                                  },
                                  onSaved: (value){
                                    passwordController.text = value!;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  autofocus: false,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Confirm Password',
                                    prefixIcon: Icon(Icons.key),
                                    labelStyle: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent, fontSize: 15),
                                  ),
                                  controller: confirmPasswordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter required field';
                                    }
                                    if (confirmPasswordController.text != passwordController.text ) {
                                      return "Password don't match";
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    confirmPasswordController.text = value!;
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    signUp(emailController.text, passwordController.text);
                                    // Navigator.pushNamed(
                                    //     context, 'DashBoard');
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                      Colors.deepPurpleAccent,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 100)),
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, 'LoginPage');
                                    },
                                    child: Text("Cancel"),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e){
              Fluttertoast.showToast(msg: e!.message);
        });
      }on FirebaseAuthException catch(error){
        switch (error.code){
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed. ";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong. ";
            break;
          case "user-not-found":
            errorMessage = "user with this email doesn't exist. ";
            break;
          case "user-disabled":
            errorMessage = "User disabled with this email. ";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests. ";
            break;
          case "Operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully ");

    Navigator.pushNamed(context, 'DashBoard');
  }
}
