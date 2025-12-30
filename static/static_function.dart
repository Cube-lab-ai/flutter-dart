class Log {
  int a = 34;
  Log.internal();
}

// 1️⃣ static

// Accessed using the class: ClassName.member
// Belongs to the class, not to any object
// Returns a value or method, not a new object

// Example:
class MathUtils {
  static int constantNumber = 34;
  static int Function(int value) MultiplyByTwo(int value) {
    return (int v) {
      return value * v;
    };
  }
}

// ---------------------------------------------------

// Ah! I see what’s confusing you 😄 — it looks like it’s creating two instances, but actually it’s not. Let me explain carefully.

// Step 1: Private constructor
// Logger._internal();

// This just defines the constructor, it does not create an object by itself
// Think of it as a blueprint for creating a Logger
// It doesn’t run until you call it somewhere

// Step 2: Static instance
// static final Logger _instance = Logger._internal();
// This actually creates a single Logger object
// _instance is now the only Logger object in memory

// Step 3: Factory constructor
// factory Logger() {
//   return _instance;
// }

// Whenever you call Logger(), it returns the already created _instance
// It does not call _internal() again

// 2️⃣ factory
// Accessed using the class: ClassName()
// Belongs to the class as a constructor
// Returns an object (either a new one or an existing one)

// Example (singleton):

// 🔥 Core rule (VERY important)
// A factory constructor can only access static members because no object exists yet.
// A factory constructor:
// Is called before any object exists
// Decides what object to return
// May return:
// an existing object
// a new object
// a cached object
// Does not have this

class Logger {
  Logger._internal();

  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }
}

void main() {
  int Function(int) multiple = MathUtils.MultiplyByTwo(3);
  int number = multiple(43);
  print(MathUtils.constantNumber);
  print(number);

  Logger a = Logger();
  Logger b = Logger();
  print(identical(a, b)); // true

  final log = Log.internal();
}
