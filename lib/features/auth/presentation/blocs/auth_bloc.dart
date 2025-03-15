import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:vortex/core/error/failure.dart';
import 'package:vortex/features/auth/domain/usecases/login.dart';
import 'package:vortex/features/auth/domain/usecases/register.dart';
import 'package:vortex/features/auth/domain/usecases/logout.dart';
import 'package:vortex/features/auth/domain/usecases/forgot_password.dart';
import 'package:vortex/features/auth/domain/usecases/remove_account.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Register register;
  final Logout logout;
  final ForgotPassword forgotPassword;
  final RemoveAccount removeAccount;
  AuthBloc(
      {required this.login,
        required this.register,
        required this.logout,
        required this.forgotPassword,
        required this.removeAccount}) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
    on<RemoveAccountRequested>(_onRemoveAccountRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthUnauthenticated());
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await login(email: event.email, password: event.password);
      emit(AuthAuthenticated(user: user));
    } on AuthException catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await register(username: event.username, email: event.email, password: event.password);
      emit(AuthUnauthenticated());
    } on AuthException catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    await logout();
    emit(AuthUnauthenticated());
  }

  Future<void> _onForgotPasswordRequested(ForgotPasswordRequested event, Emitter<AuthState> emit) async {
    try {
      await forgotPassword(email: event.email);
    } on AuthException catch (e) {
      emit(AuthError(message: e.message));
    }
  }

  Future<void> _onRemoveAccountRequested(RemoveAccountRequested event, Emitter<AuthState> emit) async {
    try {
      await removeAccount();
      emit(AuthUnauthenticated());
    } on AuthException catch (e) {
      emit(AuthError(message: e.message));
    }
  }
}