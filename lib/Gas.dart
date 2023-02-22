import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class GasButton extends StatefulWidget {
  const GasButton({Key? key}) : super(key: key);

  @override
  State<GasButton> createState() => _GasButtonState();
}

class _GasButtonState extends State<GasButton> {
  final fireStore = FirebaseFirestore.instance.collection('Gas').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          titleSpacing: 20.0,
          title: Text('Mileage log'),
          // actions: [
          //   IconButton(onPressed: (){}, icon: Icon(Icons.search))
          // ],
        ),
        drawer: MyDrawers(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
                SizedBox(height: 15,),
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
                                        Text(snapshot.data!.docs[index]['odometer'].toString()),
                                          // Text(snapshot.data!.docs[index]['Price'].toString()),
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
            Navigator.pushNamed(context, 'GasLargeButton');
          },
        ));
  }
}
