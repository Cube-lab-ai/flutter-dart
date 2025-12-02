import 'package:flutter/material.dart';

void main() {
  runApp(ParentDataWidget());
}

class ParentDataWidget extends StatefulWidget {
  const ParentDataWidget({super.key});

  @override
  State<ParentDataWidget> createState() => _LiveTextScreenState();
}

class _LiveTextScreenState extends State<ParentDataWidget> {
  String printSomething() {
    return "The number is: 34";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomElevatedButton(
        onPressed: () {
          final result = printSomething();
          return result;
        },
      ),
    );
  }
}

class CustomElevatedButton extends StatefulWidget {
  final String Function() onPressed; // your function type

  const CustomElevatedButton({super.key, required this.onPressed});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final result = widget.onPressed(); // CALL the function here
            print(result); // NOW it prints correctly
          },
          child: Text('on press'),
        ),
      ),
    );
  }
}
