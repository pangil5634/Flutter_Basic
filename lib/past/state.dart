import 'package:flutter/material.dart';

// 1. StatefulWidget 클래스 정의
class MyCounterApp extends StatefulWidget {
  const MyCounterApp({super.key});

  @override
  State<MyCounterApp> createState() => _MyCounterAppState();
}

// 2. State 클래스 정의
class _MyCounterAppState extends State<MyCounterApp> {
  // 이곳에 위젯의 상태(State) 변수들을 정의합니다.
  int _counter = 0; // 예시: 카운터 값

  // 이곳에 상태를 변경하는 메서드들을 정의합니다.
  void _incrementCounter() {
    // setState()를 호출해야 상태가 변경되었음을 Flutter에 알리고 화면을 다시 그립니다.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 이곳에서 현재 상태에 따라 UI를 그립니다.
    return Column(
      children: [
        Text('카운터: $_counter', style: const TextStyle(fontSize: 24)),
        TextButton(child: Text("증가하기"), onPressed: () => _incrementCounter()),
      ],
    );
  }
}
