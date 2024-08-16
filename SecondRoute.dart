import 'Five.dart';
import 'ThirdRoute.dart';
import 'package:flutter/material.dart';
import 'FourthRoute.dart';
import 'seven.dart';
import 'Eight.dart';
import 'Nine.dart';
void main() {
  runApp(Secondroute());
}

class Secondroute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ACE Engineering college'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'FourthRoute') {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Fourthroute()),);
                } else if (value == 'Five') {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Five()),);
                }
                else if (value == 'ThirdRoute') {
                  Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ThirdRoute()),
                );
                }
                else if (value == 'Eight') {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Eight()),);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 'FourthRoute',
                    child: Text('Mark Attedance'),
                  ),
                  PopupMenuItem(
                    value: 'Five',
                    child: Text('Check Data'),
                  ),
                  PopupMenuItem(
                    value: 'ThirdRoute',
                    child: Text('Additional Class'),
                  ),PopupMenuItem(
                    value: 'Eight',
                    child: Text('Profile'),
                  ),
                ];
              },
                icon: Icon(Icons.menu),
       ),
    ],
    ),
      body:Center(
        child: Padding(

          padding: const EdgeInsets.all(16.0),

          child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,

                backgroundImage: NetworkImage('https://wallpapercave.com/wp/wp5120809.jpg'),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome Vaishnavi',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );

  }
}
