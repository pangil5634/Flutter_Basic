import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext contest) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Asset'),
          Image.asset(
            'assets/flutter-lockup.png',
            width: 300,
            height: 100,
            fit: BoxFit.contain,
          ),

          SizedBox(height: 50),

          Text('Network'),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDl6MYXHMPJg-VkRIL3oEKwpgSQ9JkUJxWuQ&s',
            width: 300,
            height: 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
