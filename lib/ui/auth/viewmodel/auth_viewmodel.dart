import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {

  final AuthRepository repository;

  AuthViewModel(this.repository);

  bool isLoading = false;
  String? errorMessage;

  String? validateLogin(
      String email,
      String password,
      ) {

    if (email.trim().isEmpty ||
        password.trim().isEmpty) {

      return "Please input email and password";
    }

    return null;
  }

  Future<void> login(
      String email,
      String password,
      ) async {

    try {
      isLoading = true;
      notifyListeners();

      await repository.login(
        email,
        password,
      );

    } on FirebaseAuthException catch (e) {

      errorMessage = e.message;

    } finally {

      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(
      String email,
      String password,
      ) async {

    try {
      isLoading = true;
      notifyListeners();

      await repository.register(
        email,
        password,
      );

    } on FirebaseAuthException catch (e) {

      errorMessage = e.message;

    } finally {

      isLoading = false;
      notifyListeners();
    }
  }
}