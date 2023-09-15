import 'package:flutter/material.dart';

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