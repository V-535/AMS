import 'package:flutter/material.dart';
import 'ThirdRoute.dart';
import 'SecondRoute.dart';
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
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  String selectedYear = '2';
  String selectedSection = 'CSE-A';
  String selectedSubject = 'JAVA_PRG';
  List<String> selectedHours = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Tracker'),actions: <Widget>[
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
              value: 'Option 3',
              child: Text('Log out'),),
          ],
        ),
      ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(  "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,),
            ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date')),
            SizedBox(height: 16),
            buildDropdown('Year', ['1', '2', '3', '4'], selectedYear, (value) {
              setState(() {
                selectedYear = value!;
              });
            }),
            buildDropdown('Section', ['CSE-A', 'CSE-B', 'CSE-C'], selectedSection, (value) {
              setState(() {
                selectedSection = value!;
              });
            }),
            buildDropdown('Subject', ['JAVA_PRG', 'C++_PRG', 'DSA'], selectedSubject, (value) {
              setState(() {
                selectedSubject = value!;
              });
            }),
            SizedBox(height: 16),
            Text('Selected Hour(s): ${selectedHours.isEmpty ? 'None' : selectedHours.join(', ')}'),
            SizedBox(height: 14),
            buildDropdown('Hours', ['1', '2', '3', '4'], selectedYear, (value) {
              setState(() {
                selectedYear = value!;
              });
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>ThirdRoute()),);
                // Within the `FirstRoute` widget:
                // Add sign-in logic here
              },
              child: Text('Proceede'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Secondroute()),);
                // Within the `FirstRoute` widget:
                // Add sign-in logic here
              },
              child: Text('Go Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label),
        SizedBox(height: 8),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}


