import 'package:flutter/material.dart';
import 'package:test_app/rive/coffee.dart';
// import 'package:test_app/rive/rivescree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // ✅ key 추가됨

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: Scaffold(body: CoffeeRatingScreen()),
    );
  }
}
