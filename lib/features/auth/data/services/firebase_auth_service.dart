import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';
import '../error/auth_exception.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromFirebaseAuth(e);
    }
  }

  @override
  Future<User?> signUp({required String username, required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = userCredential.user!;
      await user.updateDisplayName(username);
      // await _firebaseFirestore.collection("users").doc(user.uid).set({'uid': user.uid, 'displayName': username});
      return user;
    } on FirebaseAuthException catch(e) {
      throw AuthException.fromFirebaseAuth(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> removeAccount() {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }

  @override
  User? get currentUser => _firebaseAuth.currentUser;
}