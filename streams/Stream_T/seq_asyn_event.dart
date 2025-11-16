// data that arrives over time — not all at once.

// 🔸 Analogy: Water Pipe

// Imagine a pipe (stream):

// Water (data) flows through it drop by drop.

// You don’t get all the water at once.

// You wait for the next drop — it comes asynchronously (i.e., after a delay, at any time)

// 🔹 What does "asynchronous" mean?

// "Asynchronous" means not happening immediately — you might have to wait for the next value.

// Streams are designed for situations where:

// You don’t know when the next value will come

// You want to react when it arrives

import 'dart:async';

// Function that returns a Stream<int>
Stream<int> countStream(int maxCount) async* {
  for (int i = 1; i <= maxCount; i++) {
    await Future.delayed(Duration(seconds: 1)); // simulate delay
    yield i; // emit the value
  }
}

void main() {
  // Create a Stream<int> that emits numbers from 1 to 5, one every second
  Stream<int> numberStream = countStream(5);

  // Listen to the stream and print each number when it arrives
  numberStream.listen(
    (number) {
      print('📥 Received number: $number');
    },
    onDone: () {
      print('✅ Stream finished!');
    },
  );
}
