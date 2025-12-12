// returnType get name => expression;

// without getters
import 'dart:math' as math;

class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  String fullName() {
    return '$firstName $lastName';
  }
}

// -----------------------------------------

// with getters
class Person1 {
  String firstName;
  String lastName;
  Person1(this.firstName, this.lastName);
  String get fullName => '$firstName $lastName';
}

// ----------------------------------------

// getters and setters

// without getters and setters
// class Person {
//   String name;
//   int age;

//   Person(this.name, this.age);
// }

// void main() {
//   var p = Person("Sam", 20);
//   print(p.age);
//   p.age = -5;
// }

// ----------------------------------------------------------

// with getters and setters
class Person2 {
  String _name = "";
  int _age = 0;

  // Getter
  int get age => _age;

  // Setter
  set age(int value) {
    if (value >= 0) {
      _age = value;
    } else {
      throw Exception("Age cannot be negative!");
    }
  }

  String get name => _name;
  set name(String value) => _name = value;
}

// -----------------------------------------
class Persion {
  String _name = "";
  int _age = 0;

  set age(int number) {
    _age = number;
  }

  int get persionage => _age;
}

// -----------------------------------------
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height; // no stored variable
}

// ------------------------------------------
class User {
  String firstName;
  String lastName;

  User(this.firstName, this.lastName);

  String get fullName => "$firstName $lastName".trim();
}

// ----------------------------------------------------
class Product {
  double _price = 0;

  double get price => _price;

  set price(double value) {
    if (value < 0) {
      throw Exception("Price cannot be negative");
    }
    _price = value;
  }
}

// -----------------------------------------------------
class BankAccount {
  double _balance = 100.0;

  double get balance => _balance;
}

// ---------------------------------------------------

// 🔥 5. Setter That Triggers Side Effects
// You can run extra logic when a value changes.

class Counter {
  int _value = 0;

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
    _notifyListeners(); // like setState() inside a model
  }

  void _notifyListeners() {
    print("Value updated!");
  }
}

// ---------------------------------------------
// 🔥 6. Lazy Initialization Getter
class Config {
  String? _token;

  String get token {
    _token ??= _loadTokenFromDisk();
    return _token!;
  }

  String _loadTokenFromDisk() {
    print("Loading token...");
    return "abc123";
  }
}

// ---------------------------------
// 🔥 9. Immutable Classes Use Getters Only
// Used a lot in Flutter models & state management (Bloc, Riverpod, etc.)

class Car {
  int _speed = 0;
  set kmh(int value) => _speed = value;
  int get kmh => _speed;
}

// ----------------------------------
// operator overloading
class Vec {
  double x, y;

  Vec(this.x, this.y);

  double get length => math.sqrt(x * x + y * y);
}

// -----------------------------------
// class Builder {
//   String _text = "";

//   Builder setText(String value) {
//     _text = value;
//     return this; // allows chaining
//   }

//   String build() => _text;
// }

// void main() {
//   var result = Builder().setText("Hello, world!").build();
//   var result2 = Builder();
//   result2.setText('hello');
//   print(result2.build());
//   print(result); // Output: Hello, world!
// }

// -------------------------------------

// 🔥 11. Chaining Setters (Fluent API)
class Builder {
  String _text = "";

  Builder setText(String value) {
    _text = value;
    return this;
  }

  String build() => _text;
}

// -----------------------------------------------
// 🔥 13. Getter + Setter for JSON Models
class User1 {
  String _name = "";

  String get name => _name;
  set name(String val) => _name = val;

  Map<String, dynamic> toJson() => {'name': _name};
}

void main() {
  print(Builder().setText('value').build());
}
