import 'package:flutter/material.dart';

import 'stack_navigation.dart';
import 'bottom_tab_navigation.dart';
import 'drawer_navigation.dart';
import 'tab_navigation.dart';

class BottomNavigationExample extends StatefulWidget {
  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    StackNavigationExample(),
    BottomTabNavigationExample(),
    DrawerNavigationExample(),
    TabNavigationExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.layers,
              color: Colors.black87,
            ),
            label: 'Stack',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tab,
              color: Colors.black87,
            ),
            label: 'Bottom Tab',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.black87,
            ),
            label: 'Drawer',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tab,
              color: Colors.black87,
            ),
            label: 'Tab',
          ),
        ],
      ),
    );
  }
}