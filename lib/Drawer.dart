import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class MyDrawers extends StatefulWidget {
  const MyDrawers({Key? key}) : super(key: key);

  @override
  State<MyDrawers> createState() => _MyDrawersState();
}

class _MyDrawersState extends State<MyDrawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurpleAccent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: Icon(Icons.dehaze, color: Colors.white),
              title: Text(
                'Mileage log',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'VehicleLargeButton');
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_bar_chart, color: Colors.white),
              title: Text(
                'Statistics',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'Charts');
              },
            ),
            ListTile(
              leading: Icon(
                  Icons.stacked_line_chart_sharp, color: Colors.white),
              title: Text(
                'Charts',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'Charts');
              },
            ),
            Divider(color: Colors.white),
            ListTile(
              leading: Icon(Icons.notifications_outlined, color: Colors.white),
              title: Text(
                'Reminders',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'Remainders');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class  MyDate extends StatefulWidget {
  const MyDate({Key? key}) : super(key: key);

  @override
  State<MyDate> createState() => _MyDateState();
}

class _MyDateState extends State<MyDate> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: () async {
            DateTime? datePicked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(200000));
            if (datePicked!= null){
              print('Date selected: ${datePicked.day}+${datePicked.month}+${datePicked.year}');
            }
          },
          child: Text('Select date'),
      );
  }
}

class  Mytime extends StatefulWidget {
  const Mytime({Key? key}) : super(key: key);

  @override
  State<Mytime> createState() => _MytimeState();
}

class _MytimeState extends State<Mytime> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
       TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
           initialEntryMode: TimePickerEntryMode.dial,
       );
       if (pickedTime!= null){
          print('Date selected: ${pickedTime.hour}+${pickedTime.minute}');
        }
      },
      child: Text('Select time'),
    );
  }
}

class  MyImage extends StatefulWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null)
        return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e){
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async{
        //   image != null ?
        //   Image.file(
        //   image!,
        //   height: 160,
        //   width: 160,
        //   fit: BoxFit.cover,
        // ),
        },
        child: Text('Image'),
    );
  }
}