import 'package:learning_app/Utilities/enums.dart';

class AuthViewModel {
  final AuthState state;
  final String? message;
  final String? error;
  final String? email;

  AuthViewModel({
    this.state = AuthState.initial,
    this.message,
    this.error,
    this.email,
  });
}