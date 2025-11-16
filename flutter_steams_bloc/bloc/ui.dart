// main.dart
// StreamBuilder listens to the stateStream from the BLoC and updates the UI with the counter value.
// The state is initialized immediately in the BLoC, so the UI displays the initial counter value right away without needing to wait.
// No CircularProgressIndicator is used. The StreamBuilder will show the UI once the state is available.

// lib/
//   ├── main.dart         // UI code
//   ├── counter_bloc.dart // BLoC logic
//   ├── event.dart        // Event classes
//   └── state.dart        // State classes

import 'package:flutter/material.dart';
import 'package:flutter_stream/bloc/bloc.dart';
import 'event.dart';
import 'state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose(); // Dispose of the BLoC when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple BLoC Counter'),
      ),
      body: Center(
        child: StreamBuilder<CounterState>(
          stream: _counterBloc.stateStream, // Listen to the BLoC's state stream

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('No data available'); // Shouldn't happen now
            }

            final counterState = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter: ${counterState.counter}',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Trigger the IncrementEvent when the button is pressed
                    _counterBloc.eventSink.add(IncrementEvent());
                  },
                  child: Text('Increment'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Summary:
// Event: Represents the user action (e.g., button press to increment the counter).
// State: Represents the current value of the counter.
// BLoC: Handles the logic of updating the counter and emitting new states.
// UI: Listens to the state and displays the counter value, incrementing it when the button is pressed.
