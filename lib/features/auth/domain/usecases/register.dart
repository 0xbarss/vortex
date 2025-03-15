import 'package:vortex/features/auth/data/repositories/auth_repository.dart';

class Register {
  final AuthRepository authRepository;

  Register(this.authRepository);

  Future<dynamic> call({required username, required String email, required String password}) async {
    return await authRepository.register(username, email, password);
  }
}