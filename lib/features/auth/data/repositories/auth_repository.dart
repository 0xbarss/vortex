import '../services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository(this.authService);

  Future<dynamic> signIn({required String email, required String password}) async {
    return await authService.signIn(email: email, password: password);
  }

  Future<dynamic> signUp({required String username, required String email, required String password}) async {
    return await authService.signUp(username: username, email: email, password: password);
  }

  Future<void> signOut() async {
    await authService.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await authService.resetPassword(email: email);
  }

  Future<void> removeAccount() async {
    await authService.removeAccount();
  }
}