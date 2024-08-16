import 'ThirdRoute.dart';
import 'package:flutter/material.dart';
import 'SecondRoute.dart';
import 'six.dart';
void main() {
  runApp(seven());
}

class seven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHECK ATTENDENCE'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details of attendance on the day:\nAugust 17, 2023',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Center(child: Text('PRESENT',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green),)),
                  Center(child: Text('1',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green),)),
                ]),
                TableRow(children: [
                  Center(child: Text('ABSENT',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.red),)),
                  Center(child: Text('4',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.red),)),
                ]),
                TableRow(children: [
                  Center(child: Text('TOTAL',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),)),
                  Center(child: Text('6',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),)),
                ]),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> Secondroute()),);
                  // Handle Go Home button press
                },
                child: Text('GO HOME'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
