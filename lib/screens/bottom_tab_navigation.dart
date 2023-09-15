import 'package:flutter/material.dart';

import '../pages/first_tab.dart';
import '../pages/second_tab.dart';
import '../pages/third_tab.dart';

class BottomTabNavigationExample extends StatefulWidget {
  @override
  _BottomTabNavigationExampleState createState() =>
      _BottomTabNavigationExampleState();
}

class _BottomTabNavigationExampleState
    extends State<BottomTabNavigationExample> {
  int _currentIndex = 0;
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Tab'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(
          child:Column(
            children: [
              FirstTab(),
              SizedBox(
                height: 20,
              ),
              Text('$_counter',
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
              ),
            ],
          )
          ),
          SecondTab(),
          ThirdTab(),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) => setState(
            () => this._currentIndex = index,
          ),
          animationDuration: Duration(seconds: 1),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings'),
            NavigationDestination(
                icon: Icon(Icons.help_outline),
                selectedIcon: Icon(Icons.help),
                label: 'Help')
          ],
        ),
      ),
    );
  }
}