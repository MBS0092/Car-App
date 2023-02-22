import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  static Future<User?> loginUsingEmailPassword(
  {required String email, required String password, required BuildContext}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if (e.code == "user-not-found"){
        print("No user found for that email");
      }
    }
    return user;
  }

  String? errorMessage;
  final _formKey = GlobalKey<FormState>();


  var email = '';
  var password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  clearText() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 400),
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
            height: 500,
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
                      'Welcome',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 44.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Car Manager App',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
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
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
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
                                    if (value!.isEmpty) {
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
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.key),
                                    labelStyle: TextStyle(fontSize: 20.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent, fontSize: 15),
                                  ),
                                  controller: passwordController,
                                  validator: (value) {
                                    RegExp regex = new RegExp(r'^,{6,}$');
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    if (!regex.hasMatch(value))
                                      return ("Enter Min 6 Character");
                                  },
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, 'ForgetPassword');
                                    },
                                    child: Text("Forget Password"),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    User? user = await loginUsingEmailPassword(email: emailController.text, password: passwordController.text, BuildContext: BuildContext);
                                    print('user');
                                    if (user != null) {
                                      Navigator.pushNamed(context, 'DashBoard');
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.deepPurpleAccent,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 100)),
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have account ?"),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'CreateAccountPage');
                                        },
                                        child: Text("Register"))
                                  ],
                                )
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
}

//login Function

//   void signIn(String email, String password) async
//   {
//     var _formkey;
//     if (_formkey.currentState!.validate())
//     {
//       await _auth.signInWithEmailAndPassword(email: email, password: password)
//           .then((value) => null)
//
//     }
//   }
