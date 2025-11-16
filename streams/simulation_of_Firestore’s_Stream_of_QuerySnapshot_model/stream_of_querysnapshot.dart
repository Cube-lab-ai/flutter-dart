import 'dart:async';

/// Represents a single document snapshot (like Firestore's QueryDocumentSnapshot)
class QueryDocumentSnapshot {
  final String id;
  final Map<String, dynamic> data;

  QueryDocumentSnapshot({required this.id, required this.data});

  Map<String, dynamic> getData() => data;
}

/// Represents a collection snapshot (like Firestore's QuerySnapshot)
class QuerySnapshot {
  final List<QueryDocumentSnapshot> docs;
  QuerySnapshot({required this.docs});
}

/// Simulated Firestore with real-time stream
class MockFirestore {
  final Map<String, Map<String, dynamic>> _documents = {};
  final StreamController<QuerySnapshot> _controller =
      StreamController<QuerySnapshot>.broadcast();

  Stream<QuerySnapshot> snapshots() => _controller.stream;

  void _emitSnapshot() {
    final docs = _documents.entries.map((entry) {
      return QueryDocumentSnapshot(id: entry.key, data: entry.value);
    }).toList();

    _controller.add(QuerySnapshot(docs: docs));
  }

  void addDocument(String id, Map<String, dynamic> data) {
    _documents[id] = data;
    _emitSnapshot();
  }

  void updateDocument(String id, Map<String, dynamic> updatedData) {
    if (_documents.containsKey(id)) {
      _documents[id] = updatedData;
      _emitSnapshot();
    }
  }

  void deleteDocument(String id) {
    _documents.remove(id);
    _emitSnapshot();
  }

  void dispose() {
    _controller.close();
  }
}

/// Your model class
class UserProfile {
  final String id;
  final String name;
  final String email;

  UserProfile({required this.id, required this.name, required this.email});

  factory UserProfile.fromSnapshot(QueryDocumentSnapshot doc) {
    final data = doc.getData();
    return UserProfile(id: doc.id, name: data['name'], email: data['email']);
  }

  @override
  String toString() => 'UserProfile(id: $id, name: $name, email: $email)';
}

/// Simulate the main stream usage
void main() async {
  final firestore = MockFirestore();

  // Simulate Firestore's stream<QuerySnapshot>
  Stream<QuerySnapshot> snapshotStream = firestore.snapshots();

  // Listen to the stream and convert to UserProfile objects
  snapshotStream.listen((snapshot) {
    print('🔥 New snapshot:');
    for (var doc in snapshot.docs) {
      final user = UserProfile.fromSnapshot(doc);
      print(user);
    }
    print('---');
  });

  // Simulate adding and updating data
  await Future.delayed(Duration(seconds: 1));
  firestore.addDocument('1', {'name': 'Alice', 'email': 'alice@example.com'});

  await Future.delayed(Duration(seconds: 2));
  firestore.addDocument('2', {'name': 'Bob', 'email': 'bob@example.com'});

  await Future.delayed(Duration(seconds: 2));
  firestore.updateDocument('1', {
    'name': 'Alice Smith',
    'email': 'alice@example.com',
  });

  await Future.delayed(Duration(seconds: 2));
  firestore.deleteDocument('2');

  await Future.delayed(Duration(seconds: 2));
  firestore.dispose(); // Clean up
}
