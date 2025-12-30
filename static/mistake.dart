// without using static
//   Logger log = Logger._internal();
// here it makes recursive calls

// class Logger {
//   Logger._internal() {
//     print('object');
//   }

//   Logger log = Logger._internal();

//   // factory Logger() {
//   //   return _log;
//   // }

//   int a = 34;
// }

// void main() {
//   Logger l = Logger._internal();
// }
// -----------------------------------------------------

// 1️⃣ When the Logger class is loaded
// This line runs once:
// static Logger log = Logger._internal();

// So one Logger object is created immediately and stored in Logger.log.
// Logger class loaded
// └─ static log → Logger object created

// 2️⃣ When main() runs
// Logger l = Logger._internal();
// This creates a second Logger object, because you are explicitly calling the constructor again.
// So now you have two objects:

// class Logger {
//   Logger._internal() {
//     print('object');
//   }

//   static Logger log = Logger._internal();

//   // factory Logger() {
//   //   return _log;
//   // }

//   int a = 34;
// }

// void main() {
//   Logger l = Logger._internal();
// }

// -----------------------------------------------------
// here _log is Logger._internal() so new object created every time right
// import 'static_function.dart';

// class Logger {
//   Logger._internal();

//   static Logger get _log => Logger._internal();

//   factory Logger() {
//     return _log;
//   }
// }

// void main() {
//   Logger log = Logger();
// }

// ---------------------------------------------
// Equivalent as a static function
class Logger {
  Logger._internal();

  static Logger createLogger() {
    return Logger._internal();
  }
}

void main() {
  Logger a = Logger.createLogger(); // new object
  Logger b = Logger.createLogger(); // another new object

  print(identical(a, b)); // false
}

// -------------------------------------------------

class MyFun {
  String num = "10";
  String fun() {
    return num;
  }

  String get fun1 => num;
}
