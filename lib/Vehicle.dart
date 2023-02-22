import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Dropdown.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({Key? key}) : super(key: key);

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dropController = TextEditingController();
  final MakeController = TextEditingController();
  final ModelController = TextEditingController();
  final vinController = TextEditingController();
  final licenseController = TextEditingController();
  final yearController = TextEditingController();
  final InsuranceController = TextEditingController();

  final fireStore = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'VehicleLargeButton');

            String id = DateTime.now().millisecondsSinceEpoch.toString();
            fireStore.doc(id).set({
              'name' :  nameController.text.toString(),
              'description' :  descriptionController.text.toString(),
              'make' : MakeController.text.toString(),
              'model' : ModelController.text.toString(),
              'drop' : dropController.text.toString(),
              'year' : yearController.text.toString(),
              'insurance' : InsuranceController.text.toString(),
              'vin' : vinController.text.toString(),
              'license' : licenseController.text.toString(),
              'id' : id,
              //'distance': currentItemSelected.toString(),
              //'distance' : _distanceunit,
            });
          }, icon: FaIcon(FontAwesomeIcons.save),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Field';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Field';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 230,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Units',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Distance unit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        Dropdown(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fuel unit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        DropdownFuel(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Consumption',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                        DropdownConsumption(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gas type',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      DropdownGas(),
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tank Capacity',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'drop',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: dropController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 480,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Optional',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Divider(),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Make',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: MakeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Model',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: ModelController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Year',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: yearController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'License Plate',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: licenseController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'VIN',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: vinController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Insurance Policy',
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: InsuranceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Field';
                          }
                          return null;
                        },
                      ),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}