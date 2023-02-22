import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  clearText() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          iconSize: 30.0,
          onPressed: (){
            Navigator.pushNamed(context, 'LoginPage');
          },
        ),*/
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 300),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40), topLeft: Radius.circular(40))),
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 200),
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
                        'Forget your Password',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 44.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "we'll help you reset it",
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
                                          color: Colors.redAccent,
                                          fontSize: 15),
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
                                    height: 40,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'DashBoard');
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                        Colors.deepPurpleAccent,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100)),
                                    child: Text(
                                      'Send',
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
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
