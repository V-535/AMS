import 'package:flutter/material.dart';
import 'Five.dart';
import 'FourthRoute.dart';

void main() {
  runApp(MaterialApp(home: ThirdRoute()));
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ace Engineering College'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fourthroute()),
              );
              // Handle close button press
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Grid of student buttons
                Container(
                  height: orientation == Orientation.portrait ? 600 : 500, // Adjust the height as needed
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.portrait ? 5 : 8, // More columns in landscape
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: 70, // Replace with actual number of students
                    itemBuilder: (context, index) => StudentButton(),
                  ),
                ),
                SizedBox(height: 10), // Add some space before the button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Five()),
                    );
                    // Handle student attendance button press
                  },
                  child: Text('Proceed'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    minimumSize: Size(120, 40), // Full width button
                  ),
                ),
                SizedBox(height: 16), // Add some space after the button
              ],
            ),
          );
        },
      ),
    );
  }
}

class StudentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green, // Replace with desired color
      ),
      child: Center(
        child: Text('P', style: TextStyle(color: Colors.white, fontSize: 16)), // Adjust text size if needed
      ),
    );
  }
}
