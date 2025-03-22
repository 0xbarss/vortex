import 'package:firebase_auth/firebase_auth.dart';
import 'package:vortex/core/error/failure.dart';

class AuthException extends Failure {
  AuthException(super.message);

  factory AuthException.fromFirebaseAuth(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return AuthException("The email address is badly formatted.");
      case 'user-disabled':
        return AuthException("This user account has been disabled.");
      case 'user-not-found':
        return AuthException("No user found with this email.");
      case 'wrong-password':
        return AuthException("Incorrect password. Please try again.");
      case 'email-already-in-use':
        return AuthException("The email address is already registered.");
      case 'weak-password':
        return AuthException("The password is too weak.");
      case 'operation-not-allowed':
        return AuthException("This authentication method is not allowed.");
      case 'too-many-requests':
        return AuthException("Too many login attempts. Try again later.");
      case 'network-request-failed':
        return AuthException("Network error. Please check your connection.");
      default:
        return AuthException(exception.message ?? "An unknown authentication error occurred.");
    }
  }
}