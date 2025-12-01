// what is dart

// symbol represent the rear end of the dart arrow
// player throw dart arrow to the dart board during a dart game

// Dart         =  is the dart player OR a developer
// Dart board   =  the entire ecosystem of the dart-built apps

// Dart arrow
// Precision          =  the language has to be as optimezed as possible. so that the player throw preciesly as the dart board
// Speed              =  the language must be fast and minimalist. so that the dart hitting the board runs very fast
// modifiable(@)      =  language has to be beinfit of fast hot reload
// popular framework  =  language is the foundation of the flutter

// Particularites of the dart langauge

// Dart is the type safe langauge
// Performing particular operation on the data
// The data type of x does not support another data type of f

// x is 10 . and does not support x.toUpper() x.toLower()

// Dart has the tool analysing that the developer is writing the type safe code

// Sound type system
// Static type check =  at the compile time done by the dart static analysier and ->  compilation failes
// Runtime check     =  at the run time determine the code is type safe or not    ->  throw exception

// why sound
// when type somethign on the keyboard make noise . the sound(letters or number or anything) is sent to the dart static analyser check everything and make sure the code is written type safe

// if it detects is somethign wrong it display error and won't let the program run

// static type check is like the local check preventing the developer from writing the wrong type code
// run time check is the further check when running

// how can i make sure that the dart analyser to stop checking the code anymore when writing ?
// see later

// one example
// could you please stop checking the type of the data  ?

// dynamic type  => static analyser will won't care about the type of data and we can perform random method
// and then the further chec up are done at the run time

// void main() {
//   runApp(MyApp());
//   dynamic a = 34;
//   a.torandom();
// }

// if no static check available, it will check  during run time and make sure the code is 100percent legit
// if something wrong dart will throw exception
// there is no such method a.torandom() defined for double type.i'll throw an exception
//                                                 --------

void run() {
  dynamic a = 'name';
  a.toUpperCase();
}

// Type inference

// Types are mandatory but don't have to be annotated beacuse dart automatically,statically infer the type of method and local vairable by using the var keyword
// when we assign something to the var keyword dart static analyser will automatically convert the type of value it was assigned and for the rest of the life it can be only  be specic type -> this happens using dart static analyser

// var is just a keyword telling the dart static analyser . statically asign the type for a . the check up and the type inference is done at the compile time
// dynamic is a keyword here the var a = 23; the static analyser is completely deactivated the ceck up and the type inference is done at the run time
void run1() {
  var a = 34;
}

// type infference
// in some time we need to check during run time rather than statically at the compile time , we don't want static analyser
// here only dynamic type -> it will dynamically infer the type during at the run time , local variable, methods , fields and more generic type arguments

void run2() {
  dynamic a = 34;
  print(a.runtimeType);
}

// fields
class Person {
  String name = ''; // Field 1
  int age = 9; // Field 2
}
// Every time you create a new Person object, that object gets its own copy of these fields (name and age).

// dynamic inference
// when the program is running it will dynamically asign the type .  this means a can be set into multiple type

void run3() {
  dynamic a = 34;
  print(a.runtimeType);
  a = 'name';
  print(a.runtimeType);
  a = 23.34;
  print(a.runtimeType);
}

// summary
// var a = 34; int a = 34;  here static analyser will check
// dynamic a = 34.3; a = 'data' here it will check  during run time and not the compile time . and the static analyser is deactivated

// what happens to the below program
// var a;

// Dart will automatically set it to dynamic and it will pass the job to the run time checker and the run time checker will set it to Null

// var a;
// dynamic a;
// null    a; 

// setting a var to null is not a good practise
// dart introduced expected future called sound null saftey
//                                        -----------------

// null saftey
// variable can't be null unless we say they can be sound null saftey
// sound null saftey means dart checks during static and run time
// during the life cycle data can be either nullable or non nullable but can't be both

// if a dart detects variable is non nullable then the variable is always non nullable
// non-nullbility is retained during the run time see later 
// see this later 


// How dart transform the code into the functional program on to all the supported platform
// dart converts the source code into  machine code or intermediate language -> that can run on the specific platform in the dart virtual machine 

// dart uses different compilers for the specific job 

// arm32 or arm64 or x86_64 found in the desktop or mobile phone dart uses (JIT) and (AOT) just in time, or  ahead of time compiler 

// where as in web dart uses (dart development compiler) or (dart to javascript compiler)

// when writing code there can be two or more stages during development process 

// development phase or production phase 

// development phase = easy to test, debug, live metric support, fast coding cycles -> iterate between fast code change, increamental recompilation

// inorder to run an application during the development phase the recommented way is just in time compilation(JIT) 

// JIT -> Only compiles just the amount of code it needs 
// ex 10,000 code it only compiles required code to run the application 
// this also means when we run the app again JIT does not recompile already compiled code if it has'nt change . it will use only the existing code compilation insted of compiling every code  
// JIT comes with the increamental recompilation -> it only compiles the modified part 
// JIT is the important for hot reload 

// when we modify the widget property when it is running it performs hotrelad . it will only compiles the changes 

// JIT Compiler is not the best optimal compiler during the production phase 
// 1. JIT Compiler does not transform the dart code into the machine code rather it will convert intermediatery code(that can be run on the dart virtual machine) for the faster development cycles 

// 2. In the production phase the user dones'nt care about the JIT features like testing, debugging or hot reload. only cares about the app to start run faster as it can 

// Ahead of Time compiler 
// App should start fast 
// App doesn't need debugging support 
// App doesn't need hot relaod anymore
// App should be compiled into platform specific machine code  
// It will compile the entire source code into the mach ine code 

// It does this before each build -> AOT Makes sure the build is the best most optimal version of it 

// In terms of the web apps dart has it own development and the production compiler , it will  convert the dart code into the javascript code this will discuss later indept 