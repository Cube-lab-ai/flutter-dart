import 'dart:async';

void main() {
  // Create a broadcast StreamController so multiple listeners can subscribe
  final controller = StreamController<int>.broadcast();

  // First listener
  controller.stream.listen((value) {
    print('👂 Listener 1 received: $value');
  });

  // Second listener
  controller.stream.listen((value) {
    print('👂 Listener 2 received: $value');
  });

  // Add values to the stream
  controller.add(10);
  controller.add(20);

  controller.close();
}
