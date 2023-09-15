import 'package:flutter/material.dart';

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