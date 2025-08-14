import 'package:flutter/material.dart';

class HomeIconButton extends StatelessWidget {
  const HomeIconButton({super.key});

  @override
  Widget build(BuildContext contest) {
    return Center(
      child: Column(
        children: [
          // 기본 IconButton
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.android),
            color: Colors.black,
          ),

          // 배경이 있는 IconButton
          Ink(
            // 배경 및 도형 스타일 지정
            decoration: const ShapeDecoration(
              color: Colors.deepOrange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.android),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
