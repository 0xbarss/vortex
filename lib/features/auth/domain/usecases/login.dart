import 'package:vortex/features/auth/data/repositories/auth_repository.dart';

class Login {
  final AuthRepository authRepository;

  Login(this.authRepository);

  Future<dynamic> call({required String email, required String password}) async {
    return await authRepository.login(email, password);
  }
}