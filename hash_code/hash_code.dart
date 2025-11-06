class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

void main() {
  Point p1 = Point(2, 3);
  Point p2 = Point(2, 3);

  print(p1.hashCode); // e.g., 1 (depends on Dart's internal calculation)
  print(p2.hashCode); // same as p1 because x and y are the same

  Map<String, dynamic> a = {"a": "d"};
  Map<String, dynamic> b = {"a": "d"};
  print(a['a'].hashCode);
  print(b['a'].hashCode);
  int c = 2;
  print(c.hashCode);
  print(a.hashCode);
  print(b.hashCode);
}
