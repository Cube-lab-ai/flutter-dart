class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  // + operator
  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  // - operator
  Point operator -(Point other) {
    return Point(x - other.x, y - other.y);
  }

  // == operator (equality)
  @override
  bool operator ==(Object other) {
    // 'identical' checks if both references point to the same object in memory
    if (identical(this, other)) return true;

    // Then check if the other object is a Point and has the same coordinates
    return other is Point && other.x == x && other.y == y;
  }

  // Whenever you override ==, you MUST override hashCode
  @override
  int get hashCode => Object.hash(x, y);

  // > operator (for comparing based on distance from origin)
  bool operator >(Point other) {
    return _distanceFromOrigin() > other._distanceFromOrigin();
  }

  // helper method
  double _distanceFromOrigin() => (x * x + y * y).toDouble();

  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  var p1 = Point(2, 3);
  var p2 = Point(4, 5);
  var p3 = Point(2, 3);

  print(p1 + p2); // Point(6, 8)
  print(p2 - p1); // Point(2, 2)
  print(p1 == p3); // true (same coordinates)
  print(p1 == p2); // false
  print(p2 > p1); // true (because p2 is further from origin)
}
