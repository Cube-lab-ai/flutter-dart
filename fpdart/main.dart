// import 'package:fpdart/fpdart.dart';

// /// Failure model (you define it)
// class Failure {
//   final String message;
//   Failure(this.message);
// }

// /// User model (you define it)
// class User {
//   final String id;
//   final String name;
//   final String email;

//   User({required this.id, required this.name, required this.email});
// }

// /// Functional auth interface using Either
// abstract interface class AuthRemoteDatasource {
//   Future<Either<Failure, User>> signUpWithEmailPassword({
//     required String name,
//     required String email,
//     required String password,
//   });
// }

// /// Mock implementation
// class MockAuthRemoteDatasource implements AuthRemoteDatasource {
//   @override
//   Future<Either<Failure, User>> signUpWithEmailPassword({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

//     if (email.contains('@')) {
//       // Success
//       return Right(User(id: '123', name: name, email: email));
//     } else {
//       // Error
//       return Left(Failure('Invalid email address'));
//     }
//   }
// }

// /// Example usage
// void main() async {
//   final auth = MockAuthRemoteDatasource();

//   final result = await auth.signUpWithEmailPassword(
//     name: 'Alice',
//     email: 'alice@example.com', // Try removing @ to test failure
//     password: 'securePassword123',
//   );

//   result.match(
//     (failure) => print('Signup failed: ${failure.message}'),
//     (user) => print('Signup successful! Welcome, ${user.name}'),
//   );
// }

// import 'package:flutter/widgets.dart';
// import 'package:fpdart/fpdart.dart';

// class Failure {
//   String message;
//   Failure({required this.message});
// }

// class User {
//   String name;
//   String email;
//   String password;
//   User({required this.name, required this.email, required this.password});
// }

// abstract interface class AuthRemoteDataSoruce {
//   Future<Either<Failure, User>> SigupWithEmailPassword({
//     required String name,
//     required String email,
//     required String password,
//   });
// }

// class CheckEmailPassword implements AuthRemoteDataSoruce {
//   @override
//   Future<Either<Failure, User>> SigupWithEmailPassword({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     await Future.delayed(Duration(seconds: 10));
//     if (email.contains('@')) {
//       return right(User(name: name, email: email, password: password));
//     } else {
//       return left(Failure(message: 'message'));
//     }
//   }
// }

// Future<void> main() async {
//   CheckEmailPassword email = CheckEmailPassword();
//   final result = await email.SigupWithEmailPassword(
//     name: 'rahman',
//     email: 'trumphgmail.com',
//     password: 'password',
//   );
//   result.match(
//     (failure) => print('Signup failed: ${failure.message}'),
//     (User) => print('Signup successful! Welcome, ${User.name}'),
//   );
// }
