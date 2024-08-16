import 'package:flutter/material.dart';
import 'ThirdRoute.dart';
import 'SecondRoute.dart';
import 'package:intl/intl.dart'; // Import for date and time formatting
import 'dart:async'; // Import for Timer

void main() {
  runApp(Fourthroute());
}

class Fourthroute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedYear = '2';
  String selectedSection = 'CSE-A';
  String selectedSubject = 'JAVA_PRG';
  String selectedHour = '1';
  List<String> selectedHours = [];
  late Timer _timer;
  String _currentDateTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    setState(() {
      _currentDateTime = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Tracker'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle the selected item
              print(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 3',
                child: Text('Help'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 4',
                child: Text('Log out'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Date and Time: $_currentDateTime'),
            SizedBox(height: 16),
            Text('Year'),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Year',
              ),
              onChanged: (value) {
                setState(() {
                  selectedYear = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Section'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Section',
              ),
              onChanged: (value) {
                setState(() {
                  selectedSection = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Subject'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Subject',
              ),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text('Selected Hour(s): ${selectedHours.isEmpty ? 'None' : selectedHours.join(', ')}'),
            SizedBox(height: 16),
            Text('Hour'),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Hour',
              ),
              onChanged: (value) {
                setState(() {
                  selectedHour = value;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()),
                );
                // Add sign-in logic or any other actions here
              },
              child: Text('Proceed'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}