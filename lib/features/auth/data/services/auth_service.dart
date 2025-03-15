import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vortex/core/constants/user_status_constants.dart';
import 'package:vortex/core/error/failure.dart';

abstract class AuthService {
  Future<dynamic> login(String email, String password);
  Future<void> logout();
  Future<dynamic> register(String username, String email, String password);
  Future<void> forgotPassword(String email);
  Future<void> removeAccount();
  Future<void> updateStatus(String status);
}

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<User?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      updateStatus(UserStatus.online);
      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      updateStatus(UserStatus.offline);
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    }
  }

  @override
  Future<User?> register(String username, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      await user.updateDisplayName(username);
      return user;
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromFirebaseException(e);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromFirebaseException(e);
    }
  }

  @override
  Future<void> removeAccount() async {
    try {
      updateStatus(UserStatus.offline);
      await _firebaseAuth.currentUser?.delete();
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromFirebaseException(e);
    }
  }

  @override
  Future<void> updateStatus(String status) async {
    User? user = _firebaseAuth.currentUser;
    if (user == null) return;
    await _firebaseFirestore.collection('users').doc(user.uid).update({
      'lastSeen': FieldValue.serverTimestamp(),
      'status': status
    });
  }
}