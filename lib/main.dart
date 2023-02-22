import 'package:car_app/Calculator.dart';
import 'package:car_app/Cost.dart';
import 'package:car_app/Create%20Account.dart';
import 'package:car_app/DashBoard.dart';
import 'package:car_app/Drawer.dart';
import 'package:car_app/ForgetPassword.dart';
import 'package:car_app/Remainder.dart';
import 'package:car_app/Vehicle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Chart.dart';
import 'Charts.dart';
import 'CostLargeButton.dart';
import 'Gas.dart';
import 'GasLargeButton.dart';
import 'LoginPage.dart';
import 'Reminder.dart';
import 'VehicleLargeButton.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        routes: {
          'CreateAccountPage': (context) => CreateAccountPage(),
          'ForgetPassword': (context) => ForgetPasswordPage(),
          'DashBoard': (context) => DashBoard(),
          'Vehicle': (context) => Vehicle(),
          'VehicleLargeButton': (context) => VehicleLargeButton(),
          'GasLargeButton' : (context) => GasLargeButton(),
          'GasButton' : (context) => GasButton(),
          'CostButton': (context) => CostButton(),
          'CostLargeButton': (context) => CostLargeButton(),
          'Calculator': (context) => Calculator(),
          'MyImage': (context) => MyImage(),
          'Reminders': (context) => Reminders(),
          'Remainders': (context) => Remainders(),
          'Charts':  (context) => Charts(),
          'Chart':  (context) => Chart(),

        },
      )
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: FutureBuilder(
        future: initializeFirebase(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return LoginPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

