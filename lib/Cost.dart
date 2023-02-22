import 'package:car_app/Drawer.dart';
import 'package:car_app/Dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CostButton extends StatefulWidget {
  const CostButton({Key? key}) : super(key: key);

  @override
  State<CostButton> createState() => _CostButtonState();
}

class _CostButtonState extends State<CostButton> {
  final odometerController = TextEditingController();
  final TitleController = TextEditingController();
  final CostController = TextEditingController();
  final NoteController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('Cost');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          titleSpacing: 20.0,
          title: Text('Cost log'),
        ),
      drawer: MyDrawers(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
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
              DropdownCost(),
              Divider(),
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
              Divider(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10.0, right: 150.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Pictures',
              //         style: TextStyle(
              //             color: Colors.black54,
              //             fontSize: 20.0,
              //             fontWeight: FontWeight.normal),
              //       ),
              //       IconButton(
              //         onPressed: () {},
              //         icon: Icon(Icons.add_a_photo,size:30),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child:
                Text(
                  'Optional',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 10,),
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
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(right: 230.0),
                child:
                Text(
                  'Recurrence',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              DropdownRecurrence(),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'CostLargeButton');

                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    'Odometer' :  odometerController.text.toString(),
                    'Title' :  TitleController.text.toString(),
                    'Cost' : CostController.text.toString(),
                    'Note' : NoteController.text.toString(),
                    'id' : id,
                    //'Recurrence': currentItemSelected.toString(),
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
