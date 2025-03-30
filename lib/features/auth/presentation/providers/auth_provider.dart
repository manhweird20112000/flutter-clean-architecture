import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';

part 'auth_provider.g.dart';

enum AuthStatus {
  initial,
  authenticated,
  unauthenticated,
  loading,
  error,
}

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });

  factory AuthState.initial() => AuthState(status: AuthStatus.initial);

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthState.initial();
  }

  Future<void> checkAuth() async {
    if (state.status == AuthStatus.loading) {
      return; 
    }

    state = state.copyWith(status: AuthStatus.loading);
    
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      state = state.copyWith(status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _checkCurrentUser() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await Future.delayed(const Duration(seconds: 1));
      
      final user = User(
        id: 1,
        name: 'Test User',
        email: email,
      );
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Login failed: ${e.toString()}',
      );
    }
  }

  Future<void> register(String name, String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await Future.delayed(const Duration(seconds: 1));
      
      final user = User(
        id: 1,
        name: name,
        email: email,
      );
      
      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Registration failed: ${e.toString()}',
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Logout failed: ${e.toString()}',
      );
    }
  }
}

// Providers for use cases
// @riverpod
// LoginUseCase loginUseCase(LoginUseCaseRef ref) {
//   final repository = ref.watch(authRepositoryProvider);
//   return LoginUseCase(repository);
// }

// @riverpod
// RegisterUseCase registerUseCase(RegisterUseCaseRef ref) {
//   final repository = ref.watch(authRepositoryProvider);
//   return RegisterUseCase(repository);
// }

// @riverpod
// LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
//   final repository = ref.watch(authRepositoryProvider);
//   return LogoutUseCase(repository);
// }

// @riverpod
// GetCurrentUserUseCase getCurrentUserUseCase(GetCurrentUserUseCaseRef ref) {
//   final repository = ref.watch(authRepositoryProvider);
//   return GetCurrentUserUseCase(repository);
// }

