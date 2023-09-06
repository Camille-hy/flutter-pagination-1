import 'package:flutter/material.dart';

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

class StackNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Behaviour'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the second screen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}

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
              Text('$_counter'),
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

class FirstTab extends StatefulWidget {
  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/cat1.jpg'),
        ],
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/cat2.jpg'),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/cat3.jpg'),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}

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
          child:Column(
            children: [
              FirstTab(),
              SizedBox(
                height: 20,
              ),
              Text('$_counter'),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
              ),
            ],
          ),),
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
                      SizedBox(height: 20,),
                      Text('$_counter'),
                      SizedBox(height: 20,),
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
