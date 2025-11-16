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
  var p1 = Point(2, 3);
  var p2 = Point(4, 5);

  var result = p1 + p2; // Uses our custom operator
  print(result); // Output: Point(6, 8)
}


// keyword operator -> method defines operator overload 
// + after operator specifies which operator you’re overriding.
// The method takes one parameter (other), 
// Inside, define what happens when two Point objects are added.

// this is equals to 
// var result = p1 + p2;

// var result = p1.operator +(p2);


// so you’re just calling the operator + function of p1 and passing p2 as an argument.
// var result = p1.+(p2);


