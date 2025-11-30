import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int returnNumber() {
    return 34;
  }

  @override
  Widget build(BuildContext context) {
    return ChildWidget(callBack: returnNumber);
  }
}

class ChildWidget extends StatefulWidget {
  final int Function() callBack;
  const ChildWidget({super.key, required this.callBack});

  @override
  State<ChildWidget> createState() => ChildWidgetState();
}

class ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          final int number = widget.callBack();
          print(number);
        },
        child: Text('press me'),
      ),
    );
  }
}
