import 'package:flutter/material.dart';
import 'package:flutter_test_app/ui/screens/info_screen.dart';
import 'package:flutter_test_app/ui/screens/people_screen.dart';
import 'package:flutter_test_app/ui/screens/settings_screen.dart';

import 'home_screen.dart';

class ButtonNb extends StatefulWidget {
  const ButtonNb({super.key});

  @override
  State<ButtonNb> createState() => _ButtonNbState();
}

int currentIndex= 0;
List <Widget> Screen =[
  HomeScreen(),
  peopleScreen(),
  infoScreen(),
  settingsScreen(),
];

class _ButtonNbState extends State<ButtonNb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (value){
          setState(() {
            currentIndex=value;
          });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.people),label: 'people'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'info'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
      ]),
    );
  }
}
