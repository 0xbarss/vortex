abstract class AuthService {
  Future<dynamic> signIn({required String email, required String password});
  Future<dynamic> signUp({required String username, required String email, required String password});
  Future<void> signOut();
  Future<void> resetPassword({required String email});
  Future<void> removeAccount();
  dynamic get currentUser;
}