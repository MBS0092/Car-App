import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Drawer.dart';
import 'Dropdown.dart';

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => RemindersState();
}

class RemindersState extends State<Reminders> {
  final CostController = TextEditingController();
  final TitleController = TextEditingController();
  final odometerController = TextEditingController();
  final NoteController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('Remainder');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        titleSpacing: 20.0,
        title: Text('Reminder'),
        // actions: [
        // IconButton(onPressed: (){}, icon: Icon())
        // ],
      ),
      drawer: MyDrawers(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              DropdownCost(),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                controller: TitleController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Title',
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autofocus: false,
                controller: NoteController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Note',
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: CostController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Total Cost',
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: odometerController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Odometer',
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDate(),
                  Mytime(),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Remainders');
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    'odometer' :  odometerController.text.toString(),
                    'Title' :  TitleController.text.toString(),
                    'Cost' : CostController.text.toString(),
                    'Note' : NoteController.text.toString(),
                    'id' : id,
                  });
                },
                color: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(30))),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ]),
          ),
        ),
        ),
    );
  }
}
