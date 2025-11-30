// The BLoC class handles events and updates the state.
// CounterBloc emits the initial state right away, which contains the counter value.
// When an IncrementEvent is added, the counter is incremented and the new state is emitted.

// counter_bloc.dart
import 'dart:async';
import 'event.dart';
import 'state.dart';

class CounterBloc {
  int _counter = 0; // Initialize counter to 0

  // StreamController to manage events (input)
  final _eventController = StreamController<CounterEvent>();

  // StreamController to manage states (output)
  final _stateController = StreamController<CounterState>();

  // Sink to add events to the BLoC
  Sink<CounterEvent> get eventSink => _eventController.sink;

  // Stream to listen for the state
  Stream<CounterState> get stateStream => _stateController.stream;

  // Constructor to listen to events
  CounterBloc() {
    // Emit the initial state immediately when the BLoC is created
    _stateController.sink.add(CounterState(_counter));

    // Listen for events and map them to states
    _eventController.stream.listen(_mapEventToState);
  }

  // Map events to states
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++; // Increment the counter
      _stateController.sink.add(CounterState(_counter)); // Emit the new state
    }
  }

  // Dispose the controllers to free up resources
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
