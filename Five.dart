import 'package:flutter/material.dart';
import 'ThirdRoute.dart';
import 'six.dart';

void main() {
  runApp(Five());
}

class Five extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MarkAttendancePage(),
    );
  }
}

class MarkAttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdRoute()),
            );
            // Define the back action here
          },
        ),
        title: Text('MARK ATTENDANCE'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ATTENDANCE OF:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'YEAR: III',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'CLASS: CSE B',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'TIME: 11:30 - 12:30',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'TOPICS COVERED:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Replace the previous Text widget with a TextField
            TextField(
              maxLength: 180, // Limits the input to 100 characters
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter topics covered',
                hintText: 'Type up to 100 characters...',
              ),
              maxLines: 2, // Adjust as needed; allows multi-line input
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Present:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '16',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Absent:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '45',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '61',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => six()),
                  );
                  // Define the proceed action here
                },
                child: Text('Proceed'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}