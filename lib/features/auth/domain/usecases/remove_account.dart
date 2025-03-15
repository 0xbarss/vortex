import 'package:vortex/features/auth/data/repositories/auth_repository.dart';

class RemoveAccount {
  final AuthRepository authRepository;

  RemoveAccount(this.authRepository);

  Future<dynamic> call() async {
    return await authRepository.removeAccount();
  }
}