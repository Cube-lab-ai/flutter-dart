import 'dart:async';

// "Once a value is added to a StreamController, and there is an active listener, the controller emits that value to the listener immediately."

// ✅ To Summarize
//    Action	Result
//    Add value after listen()	Listener receives the value ✅
//    Add value before listen()	Listener misses the value ❌
void main() {
  StreamController<int> controller = StreamController<int>();

  // Transform the stream: multiply each value by 2
  Stream<int> transformedStream = controller.stream.map((value) => value * 2);
  //the above line fully run and set up even though no listener has been attached yet?

  // ✅ Short Answer:

  // Yes.
  // That line fully runs, but it does not process or emit any data yet.
  // This creates a new Stream<int> object.
  // This stream is defined but inactive until someone listens to it.
  // The .map() function does not execute until a value is added and a listener is attached.
  // You're setting up a pipeline, but no data is flowing yet:
  // If a value is added (controller.add(5)), it goes through .map(...).
  // Output flows to the listener.

  print(transformedStream);

  transformedStream.listen((value) {
    print('🎯 Doubled value: $value');
  });

  controller.add(3); // Prints: Doubled value: 6

  controller.close();
}

// 🧪 What if you never listen?

// If you never attach a listener, then:

// The transformed stream is never used.

// No transformation happens.

// Any values added to the controller are simply ignored (or buffered and discarded if no listener ever appears).

/*---------------------------------------------------------------------------------------------------------------------------------------

void main() async {
  final controller = StreamController<int>();

  // Transform the stream: multiply each value by 2
  final transformedStream = controller.stream.map((value) => value * 2);
  


  transformedStream.listen((value) {
    print('🎯 Doubled value: $value');
  });

  controller.add(5); // Prints: Doubled value: 10
  await Future.delayed(Duration(seconds: 1));
  controller.add(3); // Prints: Doubled value: 6

  controller.close();
}
*/
