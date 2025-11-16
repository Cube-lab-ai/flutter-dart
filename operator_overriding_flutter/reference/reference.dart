import 'dart:async';

// 'identical' checks if both references point to the same object in memory

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  // Override the + operator
  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  var a = 'hello';
  var b = 'hello';
  print(identical(a, b)); // might be true (strings are interned)
  print(a == b); // true (values are equal)

  var p1 = Point(1, 2);
  var p2 = Point(1, 2);
  var p3 = p1;
  print(identical(p1, p2)); // false (different references)
  print(p1 == p2); // depends on your operator == implementation
  print(identical(p1, p3)); // false (different references)
  print(p1 == p3);
}
