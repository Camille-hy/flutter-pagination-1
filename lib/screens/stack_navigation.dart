import 'package:flutter/material.dart';
import '../pages/second_screen.dart';

class StackNavigationExample extends StatefulWidget {
  @override
  State<StackNavigationExample> createState() => _StackNavigationExampleState();
}

class _StackNavigationExampleState extends State<StackNavigationExample>
    with AutomaticKeepAliveClientMixin<StackNavigationExample> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(
              height: 20,
            ),
            Center(
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
          ],
        ),
      ),
    );
  }
}
