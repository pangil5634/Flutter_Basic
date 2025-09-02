import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '안녕하세요, Flutter!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        SizedBox(height: 15),
        Text(
          '저는 변치 않는 StatelessWidget이랍니다!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        SizedBox(height: 25),
        Icon(Icons.favorite, size: 50, color: Colors.redAccent),
      ],
    );
  }
}
