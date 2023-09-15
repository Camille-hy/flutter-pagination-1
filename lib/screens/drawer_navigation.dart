import 'package:flutter/material.dart';

import '../pages/first_tab.dart';
import '../pages/second_tab.dart';
import '../pages/third_tab.dart';

class DrawerNavigationExample extends StatefulWidget {
  @override
  State<DrawerNavigationExample> createState() =>
      _DrawerNavigationExampleState();
}

class _DrawerNavigationExampleState extends State<DrawerNavigationExample> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer '),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(
            child: Column(
              children: [
                FirstTab(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '$_counter',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          SecondTab(),
          ThirdTab(),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              selected: _currentIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              selected: _currentIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 3'),
              selected: _currentIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}