import 'package:flutter/material.dart';

import 'screens/bottom_navigation.dart';
import 'screens/stack_navigation.dart';
import 'screens/bottom_tab_navigation.dart';
import 'screens/drawer_navigation.dart';
import 'screens/tab_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavigationExample(),
        '/stack': (context) => StackNavigationExample(),
        '/bottomtab': (context) => BottomTabNavigationExample(),
        '/drawer': (context) => DrawerNavigationExample(),
        '/tab': (context) => TabNavigationExample(),
      },
    );
  }
}
