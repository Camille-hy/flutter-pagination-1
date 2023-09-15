import 'package:flutter/material.dart';

import '../pages/first_tab.dart';
import '../pages/second_tab.dart';
import '../pages/third_tab.dart';

class TabNavigationExample extends StatefulWidget {
  const TabNavigationExample({super.key});

  @override
  State<TabNavigationExample> createState() => _TabNavigationExampleState();
}

class _TabNavigationExampleState extends State<TabNavigationExample>
    with AutomaticKeepAliveClientMixin<TabNavigationExample> {
  @override
  bool get wantKeepAlive => true;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Tab'),
          ),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color: Colors.black87,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black87,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.help,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Container(
                      child: Column(
                    children: [
                      FirstTab(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '$_counter',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton(
                        onPressed: _incrementCounter,
                        child: const Icon(Icons.add),
                      )
                    ],
                  )),
                  Container(
                    child: SecondTab(),
                  ),
                  Container(child: ThirdTab()),
                ]),
              )
            ],
          )),
    );
  }
}