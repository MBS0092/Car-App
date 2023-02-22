import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'Drawer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _currentIndex = 0;

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
      body: Container(
        child: GridView.count(crossAxisCount: 2, children: [
          Card(
            color: Colors.deepPurpleAccent,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Calculator');
              },
              splashColor: Colors.deepPurpleAccent,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.calculate,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      'Calculator',
                      style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.deepPurpleAccent,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'GasButton');
              },
              splashColor: Colors.deepPurpleAccent,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.gas_meter,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      'Gas',
                      style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.deepPurpleAccent,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'VehicleLargeButton');
              },
              splashColor: Colors.deepPurpleAccent,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.car_rental,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      'Vehicle',
                      style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.deepPurpleAccent,
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'CostLargeButton');
              },
              splashColor: Colors.deepPurpleAccent,
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 70,
                    ),
                    Text(
                      'Cost',
                      style: new TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomSheet: SingleChildScrollView(
        child: SolidBottomSheet(
          headerBar: Container(
            color: Colors.deepPurpleAccent,
            height: 50,
            child: Center(
              child: Text(
                "Swipe Up ",
                style: new TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: Container(
              color: Colors.deepPurpleAccent,
              height: 30,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'GasLargeButton');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.gas_meter,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Text(
                          '    Refueling',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'Cost');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Text(
                          '    Cost',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'Vehicle');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.car_rental,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Text(
                          '    Vechile',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'Reminders');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        Text(
                          '    Reminder',
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
