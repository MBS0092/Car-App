import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class CostLargeButton extends StatefulWidget {
  const CostLargeButton({Key? key}) : super(key: key);

  @override
  State<CostLargeButton> createState() => _CostLargeButtonState();
}

class _CostLargeButtonState extends State<CostLargeButton> {
  final fireStore = FirebaseFirestore.instance.collection('Cost').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('Cost');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          titleSpacing: 20.0,
          title: Text('Cost log'),
          // actions: [
          //   //IconButton(onPressed: (){}, icon: Icon(Icons.search))
          // ],
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
                                    Text(snapshot.data!.docs[index]['Title'].toString()),
                                    //Text(snapshot.data!.docs[index]['odometer'].toString()),
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
            Navigator.pushNamed(context, 'CostButton');
          },
        ));
  }
}
