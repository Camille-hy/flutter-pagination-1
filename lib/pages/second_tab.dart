import 'package:flutter/material.dart';

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