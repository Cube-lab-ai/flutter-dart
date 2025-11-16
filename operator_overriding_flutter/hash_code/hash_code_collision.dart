// 1️⃣ What is a collision?

// A collision happens when two different objects produce the same hash code.

class Point {
  final int x, y;
  Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      other is Point && other.x == x && other.y == y;

  @override
  int get hashCode => x.hashCode + y.hashCode;
}

void main() {
  Point p1 = Point(1, 3);
  Point p2 = Point(2, 2);

  print(p1.hashCode); // 1 + 3 = 4
  print(p2.hashCode); // 2 + 2 = 4 ✅ Collision!
}


// Here, p1 and p2 are different points, but their hashCode is the same (4).
// That’s a collision.