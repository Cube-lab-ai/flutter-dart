import 'package:flutter/material.dart';

class LiveTextScreen extends StatefulWidget {
  const LiveTextScreen({super.key});

  @override
  State<LiveTextScreen> createState() => _LiveTextScreenState();
}

class _LiveTextScreenState extends State<LiveTextScreen> {
  String liveText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Text Update")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              hint: "Type something...",
              onTextTyped: (text) {
                // CLEAR NAME
                setState(() {
                  liveText = text;
                });
              },
            ),

            SizedBox(height: 30),

            Text(
              "Live Text: $liveText",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomTextFormField extends StatelessWidget {
  final Function(String) onTextTyped; // renamed for clarity
  final String hint;

  const CustomTextFormField({
    super.key,
    required this.onTextTyped,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        onTextTyped(value); // clearly calls parent function
      },
    );
  }
}

