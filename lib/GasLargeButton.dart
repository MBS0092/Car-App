import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Drawer.dart';
import 'Dropdown.dart';

class GasLargeButton extends StatefulWidget {
  const GasLargeButton({Key? key}) : super(key: key);

  @override
  State<GasLargeButton> createState() => _GasLargeButtonState();
}

class _GasLargeButtonState extends State<GasLargeButton> {
  final CostController = TextEditingController();
  final LitersController = TextEditingController();
  final odometerController = TextEditingController();
  final PriceController = TextEditingController();
  final NoteController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('Gas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        titleSpacing: 20.0,
        title: Text('Refueling'),
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
              DropdownMeter(),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: LitersController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Liters',
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
                controller: PriceController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Price',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDate(),
                  Mytime(),
                ],
              ),



              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 150.0),
                child: Row(
                  children: [
                    Text(
                      'Pictures',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'MyImage');
                      },
                      icon: Icon(Icons.add_a_photo,size:30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
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
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'GasButton');
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    'odometer' :  odometerController.text.toString(),
                    'Liters' :  LitersController.text.toString(),
                    'Price' : PriceController.text.toString(),
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
