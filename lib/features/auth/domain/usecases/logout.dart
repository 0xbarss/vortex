import 'package:vortex/features/auth/data/repositories/auth_repository.dart';

class Logout {
  final AuthRepository authRepository;

  Logout(this.authRepository);

  Future<dynamic> call() async {
    return await authRepository.logout();
  }
}