import 'dart:async';

void main() async {
  final controller = StreamController<String>();

  controller.stream.listen((value) {
    print('📦 Received: $value');
  });

  // Simulate real-time events
  await Future.delayed(Duration(seconds: 1));
  controller.add('First event');

  await Future.delayed(Duration(seconds: 1));
  controller.add('Second event');

  await Future.delayed(Duration(seconds: 1));
  controller.add('Third event');

  await Future.delayed(Duration(seconds: 1));
  controller.close();
}


// 📦 Received: First event
// 📦 Received: Second event
// 📦 Received: Third event
//     This is the same concept as listening to .snapshots() in Firestore.