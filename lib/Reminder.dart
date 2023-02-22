import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class Remainders extends StatefulWidget {
  const Remainders({Key? key}) : super(key: key);

  @override
  State<Remainders> createState() => _RemaindersState();
}

class _RemaindersState extends State<Remainders> {
  final fireStore = FirebaseFirestore.instance.collection('Remainder').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('Remainder');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          titleSpacing: 20.0,
          title: Text('Remainder'),
          actions: [
            //IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],
        ),
        drawer: MyDrawers(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                height: 580,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: StreamBuilder<QuerySnapshot>(
                    stream: fireStore,
                    builder: (BuildContext contex,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center
                          (child: CircularProgressIndicator());

                      if (snapshot.hasError) return Text('some error');
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                  children: [
                                    Text(snapshot.data!.docs[index]['Liters'].toString(),style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,)),
                                    Text(snapshot.data!.docs[index]['odometer'].toString(),style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,)),
                                    Text(snapshot.data!.docs[index]['Cost'].toString(),style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,)),
                                  ]
                              ),
                              color: Colors.deepPurpleAccent,

                            );
                          });
                    }),
              ),

            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            Navigator.pushNamed(context, 'Reminders');
          },
        ));
  }
}
