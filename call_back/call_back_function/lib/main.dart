// 🚫 Wrong
// onPressed: widget.callback()

// This calls the function immediately, at build time — not when the user taps the button.
// Flutter doesn’t want the result of the function.
// Flutter wants the function itself.

// ✅ Right
// onPressed: widget.callback
// Here, you are passing the function, not calling it.
// Flutter will call it later when the button is pressed.

// 🍎 Think of it like this:
// widget.callback() = “Do this right now”
// widget.callback = “Here is the function, you can call it when needed”

// -----------------------------------------------------------------------------

// 🧩 So what is () {}?
// (){} is an anonymous (inline) function.

// It means:
// void functionName() {
//   // code
// }
// but without giving it a name.

// -----------------------------------------------------------------------------
// So this:
// onPressed: () {}

// is the same as:
// void tempFunction() {}
// onPressed: tempFunction;

// -----------------------------------------------------------------------------
// 🎯 Why do we often write () { widget.callback(); }?

// Because sometimes we need to:
// call multiple things
// pass arguments
// do extra logic
// Example:

// onPressed: () {
//   print("button pressed");
//   widget.callback();   // call parent's callback
// }

// If you wrote:
// onPressed: widget.callback()

// → ❌ This calls it immediately, not on button press.

// ⭐ Summary (super clear)
// | What you write              | Meaning                                                 |
// | --------------------------- | ------------------------------------------------------- |
// | `widget.callback`           | Pass the function for later                             |
// | `widget.callback()`         | Call the function now                                   |
// | `() { widget.callback(); }` | Create a new function that will call the callback later |

import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChildWidget(
          callback: () {
            print('hello');
          },
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final VoidCallback callback;
  const ChildWidget({super.key, required this.callback});

  @override
  State<ChildWidget> createState() => ChildWidgetState();
}

class ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.callback, child: Text('print'));
  }
}
