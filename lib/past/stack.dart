import 'package:flutter/material.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext contest) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(0),
          color: Colors.amber,
        ),
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(16),
          color: Colors.blue,
        ),
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.all(32),
          color: Colors.pink,
        ),
      ],
    );
  }
}
