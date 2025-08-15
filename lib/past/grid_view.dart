import 'package:flutter/material.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext contest) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.zero,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: [
        for (int i = 0; i < 10; i++)
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[i * 100],
            child: Text('$i번째 child'),
          ),
      ],
    );
  }
}
