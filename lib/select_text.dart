import 'package:flutter/material.dart';

class HomeSelectText extends StatelessWidget {
  const HomeSelectText({super.key});

  @override
  Widget build(BuildContext contest) {
    return Center(
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Hello, We are PARD!', style: TextStyle(fontSize: 25)),
            SelectionContainer.disabled(
              child: Text(
                'Non-selectable text',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Text('Selectable text', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
