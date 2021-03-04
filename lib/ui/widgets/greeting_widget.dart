import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  final String fname;
  final String greeting;

  GreetingWidget({
    this.fname,
    this.greeting,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi $fname',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Here is your #Monday Motivation!",
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
