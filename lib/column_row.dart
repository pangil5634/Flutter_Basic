import 'package:flutter/material.dart';

class HomeColumnRow extends StatelessWidget {
  const HomeColumnRow({super.key});

  @override
  Widget build(BuildContext contest) {
    return Column(
      children: <Widget>[
        // 세로
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text('PARD '), Text('with '), Text('app part')],
        ),

        // 가로
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[Text('PARD '), Text('with '), Text('app part')],
        ),
      ],
    );
  }
}
