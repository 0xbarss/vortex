part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class AppStarted extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  final bool rememberMe;

  LoginRequested({required this.email, required this.password, required this.rememberMe});

  @override
  List<Object?> get props => [email, password];
}

class RegisterRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;

  RegisterRequested({required this.username, required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LogoutRequested extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordRequested extends AuthEvent {
  final String email;

  ForgotPasswordRequested({required this.email});

  @override
  List<Object?> get props => [email];
}

class RemoveAccountRequested extends AuthEvent {
  @override
  List<Object?> get props => [];
}