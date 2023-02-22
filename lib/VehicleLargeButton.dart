import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class VehicleLargeButton extends StatefulWidget {
  const VehicleLargeButton({Key? key}) : super(key: key);

  @override
  State<VehicleLargeButton> createState() => _VehicleLargeButtonState();
}

class _VehicleLargeButtonState extends State<VehicleLargeButton> {
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: Text('Car Manager'),
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
                    builder: (BuildContext_context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return CircularProgressIndicator();

                      if (snapshot.hasError) return Text('some error');
                      return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: (){
                                    // ref.doc(snapshot.data!.docs[index]['id'].toString()).update(
                                    //   {
                                    //     'name' :
                                    //
                                    //   });
                                  },
                                  title: Text(snapshot.data!.docs[index]['name'].toString(),style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,)),
                                  //subtitle: Text(snapshot.data!.docs[index]['Gas'].toString()),

                                );
                              }));
                    }),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            Navigator.pushNamed(context, 'Vehicle');
          },
        ));
  }
}
