import 'package:flutter/material.dart';

import 'Drawer.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<String> chart = ['Fuel','Gas Price','Total Odometer','Distance'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: chart.length,
              itemBuilder: (context, index) => buildChart(index),
          ),
        ),
    ),
    );
  }

  Widget buildChart(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(

                chart[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.lightBlue : Colors.deepPurpleAccent
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0 / 4),
                height: 2,
                width: 30,
                color: selectedIndex == index ? Colors.lightBlue : Colors.transparent,
              )
            ],
          ),
        ),

      ),
    );
  }
}
