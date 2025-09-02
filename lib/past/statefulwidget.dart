import 'package:flutter/material.dart';

class StatefulCounterApp extends StatefulWidget {
  const StatefulCounterApp({super.key, required this.title});
  final String title;

  @override
  State<StatefulCounterApp> createState() => _StatefulCounterAppState();
}

class _StatefulCounterAppState extends State<StatefulCounterApp> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  void initState() {
    super.initState();
    print('initState() 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    print('build() 호출됨');
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('버튼을 누르면 숫자가 증가해요:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 이전 화면 유지 → dispose 안 호출됨
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NextPage()),
                );
              },
              child: const Text('다음 페이지로 "푸시" 이동 (dispose 안 됨)'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // 이전 화면을 대체 → 즉시 dispose 호출됨
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const NextPage()),
                );
              },
              child: const Text('다음 페이지로 "교체" 이동 (dispose 호출됨)'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '증가',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    print('dispose() 호출됨: 리소스 정리');
    super.dispose();
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('다음 페이지')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 이전 페이지가 스택에 남아있다면 pop 시점에 그 페이지 dispose 호출됨
            Navigator.pop(context);
          },
          child: const Text(
            '이전 페이지로 돌아가기 \n(이전 페이지 dispose는 pushReplacement에서만)',
          ),
        ),
      ),
    );
  }
}
