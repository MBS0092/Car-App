import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown ({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown > {
  @override

  final _distanceunit = ["Kilometer", "Miles"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
        hint: Text('Select Distance'),
    dropdownColor: Colors.deepPurpleAccent,
    items: _distanceunit.map((String dropitem) {
    return DropdownMenuItem<String>(
    value: dropitem,
    child: Text(dropitem),
    );
    }).toList(),
    onChanged: (value) {
      print(value);
      setState(() {
        this.currentItemSelected = value;
      });

    },
        value: currentItemSelected,
    );
  }
}


class DropdownFuel extends StatefulWidget {
  const DropdownFuel ({Key? key}) : super(key: key);

  @override
  State<DropdownFuel> createState() => _DropdownFuelState();
}

class _DropdownFuelState extends State<DropdownFuel> {
  @override

  final _distanceunit = ["Liters", "Gallons", "KWh", "kg"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select Distance'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });

      },
      value: currentItemSelected,
    );
  }
}


class DropdownConsumption extends StatefulWidget {
  const DropdownConsumption ({Key? key}) : super(key: key);

  @override
  State<DropdownConsumption> createState() => _DropdownConsumptionState();
}

class _DropdownConsumptionState extends State<DropdownConsumption> {
  @override

  final _distanceunit = ["km/l", "km/gallon"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select Distance'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });

      },
      value: currentItemSelected,
    );
  }
}

class DropdownGas extends StatefulWidget {
  const DropdownGas ({Key? key}) : super(key: key);

  @override
  State<DropdownGas> createState() => _DropdownGasState();
}

class _DropdownGasState extends State<DropdownGas> {
  @override

  final _distanceunit = ["Not Set", "Gasoline", "Diesel", "CNG", "Electric"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select Distance'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });

      },
      value: currentItemSelected,
    );
  }
}
class DropdownMeter extends StatefulWidget {
  const DropdownMeter ({Key? key}) : super(key: key);

  @override
  State<DropdownMeter> createState() => _DropdownMeterState();
}
class _DropdownMeterState extends State<DropdownMeter> {
  @override

  final _distanceunit = ["Meter", "Trip"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select Odometer'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });

      },
      value: currentItemSelected,
    );
  }
}


class DropdownCost extends StatefulWidget {
  const DropdownCost ({Key? key}) : super(key: key);

  @override
  State<DropdownCost> createState() => _DropdownCostState();
}
class _DropdownCostState extends State<DropdownCost> {
  @override

  final _distanceunit = ["Service", "Maintenance","Registrartion","Parking","Wash","Tolls","Tickets/Fine","Tunning","Insurance"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select Tag'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });

      },
      value: currentItemSelected,
    );
  }
}

class DropdownRecurrence extends StatefulWidget {
  const DropdownRecurrence ({Key? key}) : super(key: key);

  @override
  State<DropdownRecurrence> createState() => _DropdownRecurrenceState();
}
class _DropdownRecurrenceState extends State<DropdownRecurrence> {
  @override

  final _distanceunit = ["One-time Cost", "Montly Cost"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select Recurrence'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });

      },
      value: currentItemSelected,
    );
  }
}

class DropdownCal extends StatefulWidget {
  const DropdownCal ({Key? key}) : super(key: key);

  @override
  State<DropdownCal> createState() => _DropdownCalState();
}
class _DropdownCalState extends State<DropdownCal> {
  @override

  final _distanceunit = ["Distance", "Trip Cost","Conumption","Required gas"];
  var currentItemSelected;

  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('Select'),
      dropdownColor: Colors.deepPurpleAccent,
      items: _distanceunit.map((String dropitem) {
        return DropdownMenuItem<String>(
          value: dropitem,
          child: Text(dropitem),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        setState(() {
          this.currentItemSelected = value;
        });
      },
      value: currentItemSelected,
    );
  }
}