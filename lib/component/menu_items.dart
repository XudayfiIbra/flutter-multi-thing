import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.deepPurple[400],
        ),
        Container(
          height: 50,
          color: Colors.deepPurple[300],
        ),
        Container(
          height: 50,
          color: Colors.deepPurple[200],
        ),
      ],
    );
  }
}
