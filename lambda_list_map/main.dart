import 'package:flutter/material.dart';

// lambda function

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
//   var addname = (String a, String b) => (a + b);
//   print(addname('name', 'name'));

//   var printsomething = () => "string";
//   print(printsomething());
// }

// void main() {
//   runApp(MyApp());
// }
// list interation

// The first element in the list is 1. print(1) is called, and 1 is printed to the console.
// The second element in the list is 2. print(2) is called, and 2 is printed to the console.
// The third element is 3. print(3) is called, and 3 is printed to the console.
// This continues for the rest of the elements in the list: 4, 5, 6.

// void main() {
//   runApp(MyApp());
//   List a = [1, 2, 3, 4, 5, 6];
//   a.forEach(print);
// }

// void main() {
//   runApp(MyApp());

//   void printnumber(int n) {
//     print(n);
//   }

//   List<int> number = [1, 2, 3, 4, 5];
//   number.forEach(printnumber);
// }

// map function

// void main() {
//   runApp(MyApp());

//   List a = [1, 2, 3, 4, 5, 6];
//   List name = a.map((item) {
//     return item;
//   }).toList();
//   name.forEach(print);
// }

// void main() {
//   runApp(MyApp());
//   List<String> fruits = ['apple', 'banana', 'orange', 'mango'];

//   List name = fruits.map((items) {
//     return items;
//   }).toList();

//   List fruitename = fruits.map((item) => item.toUpperCase()).toList();
//   print(fruitename);
// }

// -------------------------------------------
// map object

// class Person {
//   String name;
//   int age;

//   Person(this.name, this.age);
// }

// void main() {
//   List<Person> people = [
//     Person('John', 25),
//     Person('Alice', 30),
//     Person('Bob', 35),
//   ];

//   List<String> names = people.map((person) => person.name).toList();

//   List<int> namevalue = people.map((item) => item.age).toList();

//   print(names); // Output: [John, Alice, Bob]
//   print(namevalue);
// }

// -------------------------------------------------------------
// class MenuItem {
//   String value;
//   String display;

//   MenuItem(this.value, this.display);
// }

// void main() {
//   // Original list of options
//   List<String> options = ['Option 1', 'Option 2', 'Option 3'];

//   // Convert the list of strings into a list of MenuItem objects
//   List<MenuItem> menuItems = options.map((String value) {
//     return MenuItem(
//         value, value); // Using the same value for both value and display
//   }).toList();

//   // Print each MenuItem
//   for (var item in menuItems) {
//     print('Value: ${item.value}, Display: ${item.display}');
//   }
// }

// mapping each value in a list and storing those value as the object in the another list
// class menuitem {
//   String name;
//   String model;

//   menuitem({required this.name, required this.model});
// }

// void main() {
//   runApp(MyApp());

//   List items = ['wap7', 'elc3', 'fc34'];
//   List<menuitem> itemsobject =
//       items.map((item) => menuitem(name: item, model: item)).toList();
//   for (var i = 0; i < itemsobject.length; i++) {
//     print(itemsobject[i].name);
//     print(itemsobject[i].model);
//   }
// }

// The code you provided has a small issue related to the order of execution and how the ViewData list is being populated. The data.forEach loop is attempting to execute after runApp(MyApp()), which is incorrect because Flutter widgets should be initialized and the app UI should be running before any data processing happens.

// Issue:
// In Flutter, the runApp() function should be the starting point of the application, and any asynchronous or data-related tasks (like fetching or processing data) should be handled before runApp() is called, or within a StatefulWidget or in an initialization method (e.g., initState).

// Solution:
// To fix this:

// Move the data processing before runApp().
// Use a StatefulWidget to handle the dynamic population of data into the widget tree, which allows for UI updates when data is processed.

// import 'package:flutter_application_1/data.dart';

// // post of data
// class Post {
//   String UserId;
//   String id;
//   String title;
//   String body;

//   Post(
//       {required this.UserId,
//       required this.id,
//       required this.title,
//       required this.body});

//   factory Post.fromJson(map) {
//     return Post(
//         UserId: map['userId'],
//         id: map['id'],
//         title: map['title'],
//         body: map['body']);
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       List<Post> ViewData = [];
//       data.forEach((action) {
//         ViewData.add(Post.fromJson(action));
//       });
//       print(ViewData.length); // This prints the length of your ViewData list
//     });
//     return MaterialApp(
//       home: Scaffold(
//         body: Text('data'),
//       ),
//     );
//   }
// }

// USING INIT STATE TO DISPLAY DATA

// import 'package:flutter_application_1/data.dart';

// // post of data
// class Post {
//   int UserId;
//   int id;
//   String title;
//   String body;

//   Post(
//       {required this.UserId,
//       required this.id,
//       required this.title,
//       required this.body});

//   factory Post.fromJson(Map<String, dynamic> map) {
//     return Post(
//         UserId: map['userId'],
//         id: map['id'],
//         title: map['title'],
//         body: map['body']);
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Post> PostData = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     data.forEach((action) {
//       PostData.add(Post.fromJson(action));
//     });
//     print(PostData.length);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView.builder(
//           itemCount: PostData.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(PostData[index].id.toString()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
