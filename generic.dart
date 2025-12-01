void main() {
  Animal a = Animal(speak: 'what animal');
  Dog b = Dog(speak: 'meow');
  Animal labdoranimal = Dog(speak: 'bark');
  Animal c = b;
  print(b.speak);
  print(c.speak);
}

class Animal {
  String speak;
  Animal({required this.speak});
}

class Dog extends Animal {
  Dog({required String speak}) : super(speak: speak);
}

// -----------------------------------------------------
// 🧱 What is Object in Dart?

// In Dart:

// Object is the base class of all types.
// Every value in Dart is an instance of Object (or a subclass of it).

// It’s like the ultimate parent class that everything else inherits from.

int a = 5;
String b = "hello";
List<int> c = [1, 2, 3];
Map<String, dynamic> d = {'name': 'Alex'};

Object x = a; // OK
Object y = b; // OK
Object z = d; // OK

// You can assign any type to a variable of type Object, because all types extend it.

// ---------------------------------------------------------------------------------
// ❗ Limitation of Object

// Even though Object can hold any type, you can't directly use the specific properties or methods of the actual value unless you cast it.

Object something = "hello";

// Error: 'length' isn't defined for type 'Object'
// print(something.length);

void main() {
  Object something = "hello";

  // Error: 'length' isn't defined for type 'Object'
  // print(something.length);

  // Fix: Cast it
  print((something as String).length);
}

// ---------------------------------------------------------------------------------

//   🧠 What is a "Type T"?

// In Dart (and many programming languages), T is just a placeholder for a type. It’s often called a generic type.

// Think of it like this:

// "I don’t know yet what type I will use here — I’ll tell you later when I use this class or function."

// So when you see something like:

// DocumentSnapshot<T>

// 👉 "This DocumentSnapshot class can work with any kind of type, and I’ll tell you what type (T) to use when I create it."

class Box<T> {
  T content;

  Box(this.content);
}

Box<int> intBox = Box(42); // content is int
Box<String> strBox = Box("Hello"); // content is String

// DocumentSnapshot<Object> doc = await _firebaseFirestore.collection('users').doc(uid).get();

// ----------------------------------------------------------------------------------------------
// 🔁 Back to Firestore-------

DocumentSnapshot<Object> doc = ...

// That told Dart:

// “This document contains some kind of value, but I don’t know what. Just treat it as a generic Object.”

// But since Firestore documents are usually maps, it’s better to say:

DocumentSnapshot<Map<String, dynamic>> doc = ...

//----------

// class FirebaseProfileRepo extends ProfileRepo {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//   @override
//   Future<ProfileUser?> fetchProfileUser(String uid) async {
//     DocumentSnapshot<Object> doc =
//         await _firebaseFirestore.collection('users').doc(uid).get();
//     if (doc.exists) {
//       Object docData = doc.data();
//       ProfileUser.fromMap(docData as Map<String, dynamic>);
//     }
//   }
// }

// If doc.data() returns Object, then how can we use it as if it were a Map<String, dynamic> without getting an error?

// Excellent follow-up! You're asking a smart question:


// You are correctly observing that:

// doc is declared as a DocumentSnapshot<Object>.

// So doc.data() returns an Object.

// But then you're treating docData as a Map<String, dynamic>, by casting it:

docData as Map<String, dynamic>

// 🧠 How This Works
// ➤ Object is the base type

// The data is returned as Object because you said:  DocumentSnapshot<Object>


// So Dart doesn't know what exact type it is until runtime.

// But...

// ➤ Firestore actually stores document data as a Map<String, dynamic>

// Even though you typed it as Object, at runtime, the actual object is a Map<String, dynamic>

// So this cast:
docData as Map<String, dynamic>


// ✅ works at runtime,
// 🚨 but Dart can’t verify it at compile time.
// If the data wasn't a map, you'd get a runtime error.


// 🔎 Analogy

// Imagine you have a mystery box (Object), but you know that it usually contains a map inside (Map<String, dynamic>). You're just telling Dart:

// "Trust me, this Object is really a map — I know what I'm doing." by casting

// That’s what casting is.

// -------------------------------------------------------------------------------------

// ⚠️ The Risk of Casting

// If for some reason Firestore stored a value that wasn't a map (like a string or int), this would throw:

// Unhandled exception:
// type 'String' is not a subtype of type 'Map<String, dynamic>'

// So casting is a little dangerous unless you're sure about the data shape.
