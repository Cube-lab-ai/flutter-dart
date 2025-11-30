import 'package:flutter/material.dart';

class ParentWidget extends StatelessWidget {
  const ParentWidget({super.key});

  int multiple(int num) {
    return num * 20;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChildWidget(callback: multiple));
  }
}

class ChildWidget extends StatelessWidget {
  final int Function(int) callback;
  const ChildWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          int result = callback(34);
          print(result);
        },
        child: Text('Press Me'),
      ),
    );
  }
}
