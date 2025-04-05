import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_app/Utilities/enums.dart';
import 'package:learning_app/features/Auth/models/auth_model.dart';
import 'package:learning_app/features/Auth/models/signup_model.dart';
import 'package:learning_app/features/Auth/viewmodels/auth_view_model.dart';
import 'package:learning_app/services/auth_service.dart';
import 'package:learning_app/services/storage_service.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthViewModel>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<AuthViewModel> {
  final Ref ref;
  
  AuthController(this.ref) : super(AuthViewModel());

  Future<void> login(AuthModel auth) async {
    state = AuthViewModel(state: AuthState.loading);
    try {
      final email = await AuthService.login(auth);
      if (email != null) {
        // Save email to secure storage
        await ref.read(storageProvider).write(
          key: SecureStorageKeys.LOGIN_TOKEN.name,
          value: email,
        );
        
        state = AuthViewModel(
          state: AuthState.success,
          message: 'Login successful',
          email: email,
        );
      } else {
        state = AuthViewModel(
          state: AuthState.error,
          error: 'Login failed',
        );
      }
    } catch (e) {
      state = AuthViewModel(
        state: AuthState.error,
        error: e.toString(),
      );
    }
  }

  Future<void> signup(SignupModel signup) async {
    state = AuthViewModel(state: AuthState.loading);
    try {
      final response = await AuthService.signup(signup);
      if (response != null) {
        state = AuthViewModel(
          state: AuthState.success,
          message: response,
        );
      } else {
        state = AuthViewModel(
          state: AuthState.error,
          error: 'Registration failed',
        );
      }
    } catch (e) {
      state = AuthViewModel(
        state: AuthState.error,
        error: e.toString(),
      );
    }
  }
}