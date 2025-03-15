import 'package:vortex/features/auth/data/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<dynamic> login(String email, String password) async {
    return await authService.login(email, password);
  }

  Future<void> logout() async {
    await authService.logout();
  }

  Future<dynamic> register(String username, String email, String password) async {
    return await authService.register(username, email, password);
  }

  Future<void> forgotPassword(String email) async {
    await authService.forgotPassword(email);
  }

  Future<void> removeAccount() async {
    await authService.removeAccount();
  }

  Future<void> updateStatus(String status) async {
    await authService.updateStatus(status);
  }
}