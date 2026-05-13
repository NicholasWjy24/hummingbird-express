import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthRepository {

  final AuthService authService;

  AuthRepository(this.authService);

  Future<UserCredential> login(
      String email,
      String password,
      ) async {

    return await authService.login(
      email,
      password,
    );
  }

  Future<UserCredential> register(
      String email,
      String password,
      ) async {

    return await authService.register(
      email,
      password,
    );
  }

  Future<void> logout() async {
    await authService.logout();
  }
}