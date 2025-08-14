import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('App Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'PARD'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Schoole'),
        ],
        // 필요 시 상태를 올려서(currentIndex, onTap) MyHomePage에서 관리해도 된다.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Body', style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // 기능을 넣는 곳
        },
        tooltip: 'Increment',
        label: const Text('FloatingActionButton'),
        icon: const Icon(Icons.thumb_up),
      ),
    );
  }
}
