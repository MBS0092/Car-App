import 'package:car_app/Dropdown.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Drawer.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final gasController = TextEditingController();
  final priceController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('Calculator');

  int? calculate = 0, num1=0, num2=0;
  add(){
    setState(() {
      num1 = int.parse(gasController.text);
      num2 = int.parse(priceController.text);

      calculate = num1! + num2!;
    });
  }
  
  
  
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
              DropdownCal(),
              Divider(),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: gasController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Gas/l',
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
                controller: priceController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Price/l',
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
              Text(
                'Calculate : $calculate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              RaisedButton(
                onPressed: () {
                  add();
                  gasController.clear();
                  priceController.clear();

                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    'gas' :  gasController.text.toString(),
                    'Price' :  priceController.text.toString(),
                    'id' : id,
                    //'Tag': currentItemSelected.toString(),
                  });
                },
                color: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(30))),
                child: Text(
                  'Calculate',
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
