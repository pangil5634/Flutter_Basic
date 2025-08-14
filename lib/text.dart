import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  const HomeText({super.key});

  @override
  Widget build(BuildContext contest) {
    var name = 'PARD';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text의 overflow 발생 X
          Text(
            'Hello, $name! How are you?',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

          // 높은 빈공간 박스
          const SizedBox(height: 50),

          // Text의 overflow 발생 O
          SizedBox(
            width: 200,
            child: Text(
              'Hello, $name! How are you?',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
