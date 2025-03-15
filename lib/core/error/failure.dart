import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class AuthException extends Failure {
  AuthException(super.message);

  factory AuthException.fromFirebaseException(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return AuthException('Invalid email.');
      case 'user-disabled':
        return AuthException('This user has been disabled.');
      case 'user-not-found':
        return AuthException('No user found with this email.');
      case 'wrong-password':
        return AuthException('Incorrect password.');
      case 'email-already-in-use':
        return AuthException('This email is already registered.');
      case 'operation-not-allowed':
        return AuthException('Operation not allowed.');
      case 'weak-password':
        return AuthException('Your password is too weak.');
      default:
        return AuthException('An unknown error occurred.');
    }
  }
}