import 'package:vortex/features/auth/data/repositories/auth_repository.dart';

class ForgotPassword {
  final AuthRepository authRepository;

  ForgotPassword(this.authRepository);

  Future<dynamic> call({required String email}) async {
    return await authRepository.forgotPassword(email);
  }
}