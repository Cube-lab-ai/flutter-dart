//  StreamController<T> Lets you manually control the stream (add data, close it, etc.)

import 'dart:async';

void main() {
  // 1. Create a StreamController for integers
  final controller = StreamController<int>();

  // 2. Start listening to the stream
  controller.stream.listen((value) {
    print('🔔 New value: $value');
  });

  // 3. Add values to the stream
  controller.add(10);
  controller.add(20);
  controller.add(30);

  // 4. Close the stream when done
  controller.close();
}

// controller.add(10) sends the value 10 into the stream.

// The listener reacts and prints: 🔔 New value: 10

// Same for 20 and 30
