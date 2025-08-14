import 'package:flutter/material.dart';

class HomeElevatedButton extends StatelessWidget {
  const HomeElevatedButton({super.key});

  @override
  Widget build(BuildContext contest) {
    return Column(
      children: [
        // Enable
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            elevation: 10, // 버튼 그림자 깊이 (입체감)
            backgroundColor: Colors.deepOrange,
          ),
          onPressed: () {}, // 클릭 시 실행할 동작 (null이 아니므로 Enabled 상태)
          child: const Text('Enabled'), // 버튼에 표시할 텍스트
        ),

        // Disable
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: null, // null이면 Disabled 상태 (클릭 불가, 회색 처리)
          child: const Text('Disabled'), // 버튼에 표시할 텍스트
        ),
      ],
    );
  }
}
