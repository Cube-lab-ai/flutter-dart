import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_stream/bloc/ui.dart';

// oops
// classes and their function name
// class Animals {
//   void speak() {
//     print("Animals cannot speak");
//   }
// }

// Animals run() {
//   print("Animals running");
//   return Animals();
// }

// void main() {
//   Animals a = run();
//   a.speak();
// }

// -----------------------------------------INHERITANCE EXTENDED CLASS
// super class

// class animals {
//   void speak() {
//     print('animals');
//   }
// }

// class dog extends animals {
//   // @override
//   void speak() {
//     // super.speak();
//     print('dog 1');
//   }
// }

// void main() {
//   animals a = dog();
//   a.speak();
// }

// --------------------------------------------- POLYMORPHISM

// class Animals {
//   void speak(String a) {
//     print("Mention what type of animals needs to speak");
//   }
// }

// class dog extends Animals {
//   @override
//   void speak(String A) {
//     // TODO: implement speak
//     print("Dog only barks");
//   }
// }

// class cat extends Animals {
//   @override
//   void speak(String b) {
//     // TODO: implement speak
//     print('cat only meow');
//   }
// }

// void main() {
//   Animals dogspeaks = dog();
//   Animals catspeaks = cat();
//   dogspeaks.speak('h');
//   catspeaks.speak('g');
// }

// -------------------------------------------
// super class
// class Animals {
//   void speak() {
//     print("Mention what type of animals needs to speak");
//   }
// }

// class dog extends Animals {
//   run() {
//     print('dog running');
//   }
// }

// void main() {
//   dog speak = dog();
//   speak.run();
// }

// --------------------------------

// class Train {
//   String trainname;
//   String trainmodel;

//   Train(this.trainname, this.trainmodel);
// }

// class location extends Train {
//   String from;
//   String to;
//   location(this.from, this.to) : super(from, to);
// }

// void main() {
//   location n = location('dindigul', 'egmore');
//   print(n.trainmodel);
//   print(n.trainname);
// }

// extends override superconstructor s
// class Train {
//   String trainname;
//   String trainmodel;

//   Train(this.trainname, this.trainmodel);

//   void StartTran(String trainname) {
//     print('started train');
//   }
// }

// class location extends Train {
//   String from;
//   String to;
//   location(this.from, this.to) : super(from, to);

//   @override
//   void StartTran(String trainname) {
//     // TODO: implement StartTran

//     super.StartTran(trainname);
//     print(trainname);
//   }
// }

// void main() {
//   location n = location('dindigul', 'egmore');
//   print(n.trainmodel)
//   print(n.trainname);
//   n.StartTran('wap 7');
// }

// -----------------------------------------------------

void main() {
  runApp(MyApp());
}
